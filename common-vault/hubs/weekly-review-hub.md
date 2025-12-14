---
aliases:
  - Weekly Review Hub
created: 2025-06-18 07:52
title: Weekly Review Hub
type: hub
updated: 2025-12-02 14:23
---

up:: [Master Dashboard](master-dashboard.md)

# Weekly Review Hub

```meta-bind-button
label: Weekly Review
icon: ""
style: primary
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
id: ""
hidden: false
actions:
  - type: templaterCreateNote
    templateFile: templates/weekly-review-template.md
    folderPath: weekly-notes
    fileName: ""
    openNote: true
    openIfAlreadyExists: true

```

- See, [Weekly Review Process](/notes/weekly-review-process.md)

---

## Weekly Review Notes

```base
filters:
  and:
    - file.inFolder("weekly-notes")
formulas:
  Title: link(file.asLink(), title)
properties:
  note.review_from:
    displayName: From
  note.review_to:
    displayName: To
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - review_from
      - review_to
    sort:
      - property: file.ctime
        direction: DESC

```

## Readme - Weekly Review in Obsidian

- The template [weekly-review-template](weekly-review-template.md) populates weekly review activity note to reflect back.

### How to use

- Create new note from button above
- Reflect and plan
- Review notes and tasks
