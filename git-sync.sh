#!/bin/bash
# Git sync script for patch generation and application

if [ $# -eq 0 ]; then
    echo "Usage: $0 <command> [options]"
    echo ""
    echo "Commands:"
    echo "  generate                    Generate patch file from changes"
    echo "  apply <patch-file>         Apply patch file"
    echo ""
    echo "Examples:"
    echo "  $0 generate"
    echo "  $0 apply obs-changes-20241201-1430.patch"
    exit 1
fi

COMMAND="$1"
cd "/Users/iyv/code/repo/obs-common"

case "$COMMAND" in
    "generate")
        # Check if there are any changes (tracked or untracked)
        if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
            echo "No changes detected"
            exit 0
        fi

        # Add all changes and generate patch
        git add .
        PATCH_FILE="obs-changes-$(date +%Y%m%d-%H%M).patch"
        git diff --cached > "$PATCH_FILE"
        git commit -m "Changes $(date +%Y%m%d-%H%M)"

        echo "Patch generated: $PATCH_FILE"
        ;;

    "apply")
        if [ $# -ne 2 ]; then
            echo "Usage: $0 apply <patch-file>"
            exit 1
        fi

        PATCH_FILE="$2"

        # Apply patch
        git apply "$PATCH_FILE"
        git add .
        git commit -m "Applied patch $(basename $PATCH_FILE)"

        echo "Patch applied: $(basename $PATCH_FILE)"
        ;;

    *)
        echo "Invalid command: $COMMAND"
        echo "Use 'generate' or 'apply'"
        exit 1
        ;;
esac