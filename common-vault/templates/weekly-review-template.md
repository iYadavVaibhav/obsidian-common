<%*

const slug = moment().endOf("isoWeek").format("YYYY-MM-DD-ddd-") + tp.date.now('[w]ww') + "-review";
const targetPath = "/weekly-notes/" + tp.date.now("YYYY/MM-MMM/") + slug;

const currentFile = tp.file.find_tfile(tp.file.path(true));

if (await tp.file.exists(targetPath + ".md")) {
    await app.workspace.openLinkText(targetPath, "", true);
    new Notice("File Already Exists, opening it");
    if (currentFile) {
        await tp.app.vault.trash(currentFile, true);
    }
    return;

}

else {
    await tp.file.move(targetPath);
}
-%>
---
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
review_from: <% moment().startOf("isoWeek").format("YYYY-MM-DD") %>
review_to:  <% moment().endOf("isoWeek").format("YYYY-MM-DD") %>
status: review
title: "Weekly Review - <% tp.date.now('YYYY [W]ww') %>"
type: weekly_review
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

up:: [Weekly Review Hub](/hubs/weekly-review-hub.md)


# Weekly Review - <% tp.date.now('YYYY [W]ww') %>

_<% moment().startOf("isoWeek").format("ddd D") %> - <% moment().endOf("isoWeek").format("ddd D") %>_

## Reflect: Review Last Week

- **What went well? Accomplishments?**
	 - 

- **What didn't go well? Challenges?**
	 - 

## Plan for Coming Week

- Identify 1-3 "Must-Do" Projects/Major Tasks for coming Week

---

## Tasks from Daily Notes

```dataview
TASK
FROM "daily-notes"
WHERE !completed
GROUP BY file.name
SORT file.name DESC
```

## Review these Notes

```base
filters:
  and:
    - '!file.inFolder("templates")'
    - or:
        - status == "review"
        - file.tags == ["context/build"]
formulas:
  Title: link(file.asLink(), title)
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - file.folder
    sort:
      - property: file.folder
        direction: ASC
      - property: file.mtime
        direction: DESC

```


## Tasks Due Past Week

_not used_

```dataview
TASK
FROM !"templates" AND !"archive"
WHERE !completed
   AND due >= this.review_from
   AND due < (this.review_from + dur(7 days))
```

## Tasks Due Next Week

_not used_

```dataview
TASK
FROM !"templates" AND !"archive"
WHERE !completed
   AND due >= (this.review_from + dur(7 days))
   AND due < (this.review_from + dur(14 days))
```
