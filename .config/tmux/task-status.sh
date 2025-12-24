#!/bin/bash
# task-status.sh - Display taskwarrior tasks in tmux status bar
#
# Usage:
#   task-status.sh          # Returns formatted task text
#   task-status.sh --check  # Returns "1" if tasks exist, empty otherwise
#   task-status.sh 30       # Custom max length for task text

# Check if task is installed
if ! command -v task &> /dev/null; then
    exit 0
fi

# Get pending tasks: due today, overdue, no due date, or tagged +today
tasks=$(task status:pending \( due.before:today or due:today or due: or +today \) rc.verbose=nothing _unique description 2>/dev/null)

if [[ -z "$tasks" ]]; then
    exit 0
fi

# Count total tasks
count=$(echo "$tasks" | sed '/^$/d' | wc -l | tr -d ' ')

if [[ $count -eq 0 ]]; then
    exit 0
fi

# Check mode: just verify tasks exist
if [[ "$1" == "--check" ]]; then
    echo "1"
    exit 0
fi

# Display mode: format task text
MAX_LENGTH=${1:-25}

# Get first task and truncate
first_task=$(echo "$tasks" | sed '/^$/d' | head -n 1 | cut -c1-"$MAX_LENGTH")

# Add ellipsis if truncated
original_length=$(echo "$tasks" | sed '/^$/d' | head -n 1 | wc -c | tr -d ' ')
if [[ "$original_length" -gt "$MAX_LENGTH" ]]; then
    first_task="${first_task}…"
fi

if [[ $count -gt 1 ]]; then
    echo "${first_task} (+$((count-1)))"
else
    echo "$first_task"
fi

