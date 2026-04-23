#!/usr/bin/env bash
set -uo pipefail

# Walk up from CWD to find the nearest package.json with a verify script
DIR=$(pwd)
while [ "$DIR" != "/" ] && [ ! -f "$DIR/package.json" ]; do
  DIR=$(dirname "$DIR")
done

[ ! -f "$DIR/package.json" ] && exit 0

# Check if a verify script exists — skip silently if not
jq -e '.scripts.verify' "$DIR/package.json" > /dev/null 2>&1 || exit 0

# Run verify and surface failures back to Claude
cd "$DIR"
if OUTPUT=$(pnpm run verify 2>&1); then
  exit 0
else
  jq -n --arg out "$OUTPUT" --arg dir "$(basename "$DIR")" \
    '{"hookSpecificOutput":{"hookEventName":"Stop","additionalContext":("pnpm run verify failed in " + $dir + ":\n\n" + $out)}}'
  exit 2
fi