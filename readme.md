# Readme

Obsidian common templates, settings, hubs and dashboards that are common among vaults and can be shared across.

## Common files to Sync

```sh
.obsidian/snippets/*
hubs/*
templates/*
master-dashboard.md

# core
.obsidian/app.json
.obsidian/appearance.json
.obsidian/core-plugins.json
.obsidian/daily-notes.json
.obsidian/hotkeys.json

# plugins
.obsidian/plugins/dataview/data.json
.obsidian/plugins/obsidian-linter/data.json
.obsidian/plugins/obsidian-meta-bind-plugin/data.json
.obsidian/plugins/obsidian-tasks-plugin/data.json
.obsidian/plugins/templater-obsidian/data.json
```

## Sync Scripts

### Available Scripts
- `setup.sh` - One-time setup (run once on both machines)
- `copy-vault.sh` - Universal copy script (replaces 0,1,4,5)
- `git-sync.sh` - Generate and apply patches (replaces 2,3)
- `sync-config.sh` - Configuration file for files/folders to sync

### Initial Setup
Run once on both machines:
```bash
./setup.sh
```

### Copy Script Usage
```bash
./copy-vault.sh <source> <destination>
```

**Available vault types:**
- `study` - Study vault
- `work` - Work vault  
- `common` - Common vault

**Examples:**
```bash
./copy-vault.sh work common    # Copy from work-vault to common-vault
./copy-vault.sh common study   # Copy from common-vault to study-vault
```

### Sync Workflows

#### Work → Study
**Machine A (Work):**
```bash
./copy-vault.sh work common
./git-sync.sh generate
```
**Transfer patch file to Machine B**

**Machine B (Study):**
```bash
./git-sync.sh apply obs-changes-20241201-1430.patch
./copy-vault.sh common study
```

#### Study → Work
**Machine B (Study):**
```bash
./copy-vault.sh study common
./git-sync.sh generate
```
**Transfer patch file to Machine A**

**Machine A (Work):**
```bash
./git-sync.sh apply obs-changes-20241201-1430.patch
./copy-vault.sh common work
```
