#!/bin/bash

# Git Repository Manager
# Batch operations: status, pull, commit on multiple Git repos

# List of directories containing git repos (edit as needed)
REPOS=(
    "/path/to/repo1"
    "/path/to/repo2"
    "/path/to/repo3"
)

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check status of all repos
check_status() {
    for DIR in "${REPOS[@]}"; do
        echo -e "${YELLOW}Checking status in $DIR...${NC}"
        if [ -d "$DIR/.git" ]; then
            cd "$DIR"
            git status
            cd - > /dev/null
        else
            echo -e "${RED}Not a git repository: $DIR${NC}"
        fi
        echo
    done
}

# Function to pull latest changes in all repos
pull_all() {
    for DIR in "${REPOS[@]}"; do
        echo -e "${YELLOW}Pulling latest in $DIR...${NC}"
        if [ -d "$DIR/.git" ]; then
            cd "$DIR"
            git pull
            cd - > /dev/null
        else
            echo -e "${RED}Not a git repository: $DIR${NC}"
        fi
        echo
    done
}

# Function to commit changes in all repos with a message
commit_all() {
    MSG="$1"
    if [ -z "$MSG" ]; then
        echo -e "${RED}Please provide a commit message.${NC}"
        exit 1
    fi
    for DIR in "${REPOS[@]}"; do
        echo -e "${YELLOW}Committing in $DIR...${NC}"
        if [ -d "$DIR/.git" ]; then
            cd "$DIR"
            git add .
            git commit -m "$MSG"
            cd - > /dev/null
        else
            echo -e "${RED}Not a git repository: $DIR${NC}"
        fi
        echo
    done
}

# Main menu
echo -e "${GREEN}Git Repository Manager${NC}"
echo "1) Check status"
echo "2) Pull all"
echo "3) Commit all"
echo "q) Quit"
read -p "Choose an option: " CHOICE

case "$CHOICE" in
    1) check_status ;;
    2) pull_all ;;
    3)
        read -p "Enter commit message: " MSG
        commit_all "$MSG"
        ;;
    q) echo "Goodbye!"; exit 0 ;;
    *) echo -e "${RED}Invalid option.${NC}" ;;
esac