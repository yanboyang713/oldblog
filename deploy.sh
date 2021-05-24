#!/bin/bash
# Program: This program for push Hugo to github

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Add changes to git.
git add -A

# Commit changes.
msg="Published on $(date +'%Y-%m-%d %H:%M:%S')"
if [ -n "$*" ]; then
    msg="$*"
fi

git commit -m "$msg"

git push
