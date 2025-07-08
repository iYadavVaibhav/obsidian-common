#!/bin/bash
# Universal copy script for vault syncing

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source> <destination>"
    echo ""
    echo "Available sources/destinations:"
    echo "  study       - Study vault"
    echo "  work        - Work vault"
    echo "  common      - Common vault"
    echo ""
    echo "Examples:"
    echo "  $0 work common    # Copy from work-vault to common-vault"
    echo "  $0 common study   # Copy from common-vault to study-vault"
    exit 1
fi

SOURCE_TYPE="$1"
DEST_TYPE="$2"

# Load sync configuration
source "$(dirname "$0")/sync-config.sh"

# Define vault paths
case "$SOURCE_TYPE" in
    "study")  SOURCE="$STUDY_VAULT" ;;
    "work")   SOURCE="$WORK_VAULT" ;;
    "common") SOURCE="$COMMON_VAULT" ;;
    *) echo "Invalid source: $SOURCE_TYPE"; exit 1 ;;
esac

case "$DEST_TYPE" in
    "study")  DEST="$STUDY_VAULT" ;;
    "work")   DEST="$WORK_VAULT" ;;
    "common") DEST="$COMMON_VAULT" ;;
    *) echo "Invalid destination: $DEST_TYPE"; exit 1 ;;
esac

# Create destination directories
create_directories "$DEST"

# Sync directories and files
sync_directories "$SOURCE" "$DEST"
sync_files "$SOURCE" "$DEST"

echo "Files copied from $SOURCE_TYPE-vault to $DEST_TYPE-vault"