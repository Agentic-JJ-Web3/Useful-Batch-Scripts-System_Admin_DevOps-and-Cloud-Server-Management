#!/usr/bin/env bash
# Simple Todo List CLI (beginner-friendly)
# Supports: add, list, done, delete
# Tasks are stored in a plain text file: ~/.todo.txt

TODO_FILE="${HOME:-$PWD}/.todo.txt"

usage() {
  echo "Usage: $0 add|list|done|del [task number or text]"
  echo
  echo "Commands:"
  echo "  add <task>      Add a new task"
  echo "  list            List all tasks with numbers"
  echo "  done <num>      Mark task number <num> as done (removes it)"
  echo "  del <num>       Delete task number <num>"
  exit 1
}

if [ $# -lt 1 ]; then
  usage
fi

cmd="$1"; shift || true

mkdir -p "$(dirname "$TODO_FILE")"
touch "$TODO_FILE"

case "$cmd" in
  add)
    if [ $# -lt 1 ]; then
      echo "Error: no task provided"
      exit 1
    fi
    task="$*"
    echo "$task" >> "$TODO_FILE"
    echo "Added: $task"
    ;;

  list)
    if [ ! -s "$TODO_FILE" ]; then
      echo "No tasks found. Add one with: $0 add \"Buy milk\""
      exit 0
    fi
    nl -w2 -s'. ' -ba "$TODO_FILE"
    ;;

  done|del)
    if [ $# -lt 1 ]; then
      echo "Error: provide task number"
      exit 1
    fi
    num="$1"
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
      echo "Error: task number must be a positive integer"
      exit 1
    fi
    total=$(wc -l < "$TODO_FILE" | tr -d ' ')
    if [ "$num" -lt 1 ] || [ "$num" -gt "$total" ]; then
      echo "Error: task number out of range (1-$total)"
      exit 1
    fi
    # Remove the line by number
    sed -i.bak "${num}d" "$TODO_FILE"
    echo "Task $num removed"
    ;;

  *)
    usage
    ;;
esac
