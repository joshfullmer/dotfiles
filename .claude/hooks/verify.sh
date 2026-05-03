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

# Detect package manager from lock file
cd "$DIR"
if [ -f "package-lock.json" ]; then
  PM="npm run"
elif [ -f "yarn.lock" ]; then
  PM="yarn"
elif [ -f "pnpm-lock.yaml" ]; then
  PM="pnpm run"
else
  PM="npm run"
fi

if OUTPUT=$($PM verify 2>&1); then
  exit 0
else
  jq -n --arg out "$OUTPUT" --arg dir "$(basename "$DIR")" --arg pm "$PM" \
    '{"hookSpecificOutput":{"hookEventName":"Stop","additionalContext":($pm + " verify failed in " + $dir + ":\n\n" + $out)}}'
  exit 2
fi