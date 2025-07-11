#!/bin/bash
# Configuration file for sync scripts

# Load environment variables from .env file if it exists
if [ -f "$(dirname "$0")/../.env" ]; then
    source "$(dirname "$0")/../.env"
fi

# Vault paths (must be set in .env)
STUDY_VAULT="$STUDY_VAULT"
WORK_VAULT="$WORK_VAULT"
COMMON_VAULT="$COMMON_VAULT"

# Convert newline-separated strings to arrays
IFS=$'\n' read -rd '' -a SYNC_DIRS <<< "$SYNC_DIRS"
IFS=$'\n' read -rd '' -a SYNC_FILES <<< "$SYNC_FILES"

# Filter out empty strings
temp_dirs=()
for dir in "${SYNC_DIRS[@]}"; do
    [[ -n "${dir// /}" ]] && temp_dirs+=("$dir")
done
SYNC_DIRS=("${temp_dirs[@]}")

temp_files=()
for file in "${SYNC_FILES[@]}"; do
    [[ -n "${file// /}" ]] && temp_files+=("$file")
done
SYNC_FILES=("${temp_files[@]}")

# Function to create necessary directories
create_directories() {
    local dest="$1"
    
    # Create directories for sync dirs
    for dir in "${SYNC_DIRS[@]}"; do
        mkdir -p "$dest/$dir"
    done
    
    # Create parent directories for sync files
    for file in "${SYNC_FILES[@]}"; do
        mkdir -p "$dest/$(dirname "$file")"
    done
}

# Function to sync directories
sync_directories() {
    local source="$1"
    local dest="$2"
    
    for dir in "${SYNC_DIRS[@]}"; do
        if [ -d "$source/$dir" ]; then
            cp -r "$source/$dir/" "$dest/$dir/"
        fi
    done
}

# Function to sync files
sync_files() {
    local source="$1"
    local dest="$2"
    
    for file in "${SYNC_FILES[@]}"; do
        if [ -f "$source/$file" ]; then
            cp "$source/$file" "$dest/$file"
        fi
    done
}