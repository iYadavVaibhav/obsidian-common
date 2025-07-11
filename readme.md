# Readme

Obsidian common templates, settings, hubs and dashboards that are common among vaults and can be shared across.

## Sync Scripts

### Available Scripts
- `_scripts/setup.sh` - One-time setup (run once on both machines)
- `_scripts/copy-vault.sh` - Universal copy script (replaces 0,1,4,5)
- `_scripts/git-sync.sh` - Generate and apply patches (replaces 2,3)
- `_scripts/sync-config.sh` - Configuration file for files/folders to sync

### Initial Setup
1. Copy environment configuration:
```bash
cp .env.example .env
# Edit .env to customize vault paths for your machine
```

2. Run setup once on both machines:
```bash
./_scripts/setup.sh
```

### Copy Script Usage
```bash
./_scripts/copy-vault.sh <source> <destination>
```

**Available vault types:**
- `study` - Study vault
- `work` - Work vault  
- `common` - Common vault

**Examples:**
```bash
./_scripts/copy-vault.sh work common    # Copy from work-vault to common-vault
./_scripts/copy-vault.sh common study   # Copy from common-vault to study-vault
```

### Sync Workflows

#### Work → Study
**Machine A (Work):**
```bash
./_scripts/copy-vault.sh work common
./_scripts/git-sync.sh generate
```
**Transfer patch file to Machine B**

**Machine B (Study):**
```bash
./_scripts/git-sync.sh apply obs-changes-20241201-1430.patch
./_scripts/copy-vault.sh common study
```

#### Study → Work
**Machine B (Study):**
```bash
./_scripts/copy-vault.sh study common
./_scripts/git-sync.sh generate
```
**Transfer patch file to Machine A**

**Machine A (Work):**
```bash
./_scripts/git-sync.sh apply obs-changes-20241201-1430.patch
./_scripts/copy-vault.sh common work
```

## Fixing Git Apply Patch issues

Apply git if there are errors:

```sh
git apply --whitespace=nowarn --allow-binary-replacement --reject --verbose new.patch 2>&1 | grep -v -E "Falling back to direct application|cannot apply binary patch to|\.DS_Store"
```

Fixed! The `git apply` command now uses the proper flags:
    - `--whitespace=nowarn` - Ignore whitespace issues
    - `--allow-binary-replacement` - Handle binary files
    - `--reject` - Create .rej files for failed hunks
    - `--verbose` - Show detailed output
    - Filters out common noise messages with `grep -v -E`

This should handle patch application more reliably, especially with binary files and whitespace differences.

## Generate Patch including Previous Commits

```sh
# command
git diff <commit-A> <commit-B> > file.patch

# example
git diff 839c9f275f5771edh76hdbshy2d3b7853d869299 HEAD > changes-from-839c9f2.patch
```

