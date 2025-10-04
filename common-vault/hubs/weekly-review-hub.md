---
aliases:
  - Weekly Review Hub
created: 2025-06-18 07:52
title: Weekly Review Hub
type: hub
updated: 2025-07-11 17:01
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

```dataview
TABLE WITHOUT ID
link(file.path, title) as Title,
review_from as From,
review_to as To
from "weekly-notes"
WHERE file.name != "0-hub-weekly-review"
SORT file.cday DESC
```

## Readme - Weekly Review in Obsidian

- The template [weekly-review-template](weekly-review-template.md) populates weekly review activity note to reflect back.

### How to use

- Create new note from button above
- Reflect and plan
- Review notes and tasks
