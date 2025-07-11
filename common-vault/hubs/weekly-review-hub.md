---
aliases:
  - Weekly Review Hub
created: 2025-06-18 07:52
title: Weekly Review Hub
type: hub
updated: 2025-07-06 10:19
---

up:: [Master Dashboard](master-dashboard.md)

# Weekly Review Hub

```meta-bind-button
label: Weekly Review
icon: ""
style: default
class: ""
cssStyle: ""
backgroundImage: ""
tooltip: ""
style: primary
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
