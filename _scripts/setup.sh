#!/bin/bash
# One-time setup script - run once on both machines

cd "/Users/iyv/code/repo/obs-common"

# Check if git is already initialized
if [ -d ".git" ]; then
    echo "Git repository already initialized"
    exit 0
fi

# Initialize git repository
git init
git add .
git commit -m "Initial setup"

echo "Git repository initialized in /Users/iyv/code/repo/obs-common"