---
aliases: [Daily Notes Hub]
created: 2025-12-23 18:55
status: active
title: Daily Notes Hub
type: hub
updated: 2025-12-25 13:40
---

up:: [Master Dashboard](master-dashboard.md)

# Daily Notes Hub

`$= '[[daily-notes/'+moment().format("YYYY/MM-MMM/YYYY-MM-DD-ddd")+'|Today Daily Note]]'`

```base
filters:
  and:
    - file.inFolder("daily-notes")
views:
  - type: table
    name: Table
    groupBy:
      property: file.folder
      direction: DESC
    sort:
      - property: file.name
        direction: DESC

```

## Readme - Daily Notes Hub in Obsidian

- This hub shows all the daily notes stored in `daily-notes` folder, grouped by folder name.
