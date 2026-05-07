#!/usr/bin/env bash
set -u

payload=$(cat)
event=$(printf '%s' "$payload" | jq -r '.hook_event_name // "Stop"' 2>/dev/null)
msg=$(printf '%s' "$payload" | jq -r '.message // empty' 2>/dev/null)

project_dir="${CLAUDE_PROJECT_DIR:-$PWD}"
project=$(basename "$project_dir")

# Skip if user is already looking at this Claude session
front=$(osascript -e 'tell application "System Events" to bundle identifier of first application process whose frontmost is true' 2>/dev/null)
if [ "$front" = "com.mitchellh.ghostty" ]; then
  if [ -n "${TMUX:-}" ]; then
    active=$(tmux display-message -p -t "${TMUX_PANE:-}" '#{window_active}#{pane_active}' 2>/dev/null)
    [ "$active" = "11" ] && exit 0
  else
    exit 0
  fi
fi

case "$event" in
  Notification)
    title="Claude needs you"
    body="${msg:-Waiting for input}"
    sound="Funk"
    ;;
  *)
    title="Claude finished"
    body="${msg:-Task complete}"
    sound="Tink"
    ;;
esac

if command -v terminal-notifier >/dev/null 2>&1; then
  # On click: focus Ghostty + switch tmux to the pane that fired this notification.
  # Use absolute paths — terminal-notifier's click handler runs in launchd context with minimal PATH.
  click_cmd="/usr/bin/open -a Ghostty"
  if [ -n "${TMUX_PANE:-}" ]; then
    click_cmd="$click_cmd; /opt/homebrew/bin/tmux select-window -t '$TMUX_PANE' 2>/dev/null; /opt/homebrew/bin/tmux select-pane -t '$TMUX_PANE' 2>/dev/null"
  fi
  (terminal-notifier \
    -title "$title" \
    -subtitle "$project" \
    -message "$body" \
    -group "claude-code-${project_dir}" \
    -sound "$sound" \
    -execute "$click_cmd" \
    >/dev/null 2>&1 &)
else
  if [ -n "${TMUX:-}" ]; then
    printf '\033Ptmux;\033\033]9;%s — %s\033\\' "$title" "$body" > /dev/tty
  else
    printf '\033]9;%s — %s\007' "$title" "$body" > /dev/tty
  fi
fi

exit 0
