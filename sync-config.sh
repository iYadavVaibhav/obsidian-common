#!/bin/bash
# Configuration file for sync scripts

# Vault paths
STUDY_VAULT="/Users/vab/code/repo/personal_notes"
WORK_VAULT="/Users/iyv/code/repo/my-notes"
COMMON_VAULT="/Users/vab/code/repo/obs-common/common-vault"

# Directories to sync (using rsync)
SYNC_DIRS=(
    ".obsidian/snippets"
    "hubs"
    "templates"
)

# Individual files to sync (using cp)
SYNC_FILES=(
    "master-dashboard.md"
    ".obsidian/app.json"
    ".obsidian/appearance.json"
    ".obsidian/core-plugins.json"
    ".obsidian/daily-notes.json"
    ".obsidian/hotkeys.json"
    ".obsidian/plugins/dataview/data.json"
    ".obsidian/plugins/obsidian-linter/data.json"
    ".obsidian/plugins/obsidian-meta-bind-plugin/data.json"
    ".obsidian/plugins/obsidian-tasks-plugin/data.json"
    ".obsidian/plugins/templater-obsidian/data.json"
)

# Function to create necessary directories
create_directories() {
    local dest="$1"
    mkdir -p "$dest"/{.obsidian/snippets,hubs,templates,.obsidian/plugins/{dataview,obsidian-linter,obsidian-meta-bind-plugin,obsidian-tasks-plugin,templater-obsidian}}
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