#!/usr/bin/env bash
if [ -n "${TMUX:-}" ]; then
  printf '\033Ptmux;\033\033]9;Claude Code finished\033\\' > /dev/tty
else
  printf '\033]9;Claude Code finished\007' > /dev/tty
fi
