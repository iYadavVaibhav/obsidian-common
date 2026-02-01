<%*
let name = await tp.system.prompt("Enter person's name");
if (!name) name = "Unknown";

name = name.trim().replace(/\s+/g, ' ');
const titleCaseName = name
  .toLowerCase()
  .split(' ')
  .map(word => word.charAt(0).toUpperCase() + word.slice(1))
  .join(' ');

const slug = titleCaseName.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');

if (slug) {
    await tp.file.move("/people/" + slug);
}
-%>
---
aliases: [<%- titleCaseName %>]
area: social
company: 
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
email: 
name: <%- titleCaseName %>
phone: 
role: 
slug: <%- slug %>
status: active
title: <%- titleCaseName %>
type: person
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# <%- titleCaseName %>

up:: [People Hub](people-hub.md)

## Notes

- 

---

_below is automated_

## Active Tasks

```tasks
not done
description includes <%- slug %>
```

---

## Linked or Tagged

### Daily Note Mentions

_inline tagged or linked, excludes ~~type/meeting~~_

```dataview
LIST
    L.text
FROM "daily-notes"
FLATTEN file.lists as L
WHERE (contains(L.text, "<%- slug %>") OR contains(L.text, "<%- titleCaseName %>")) AND !contains(L.text, "#type/meeting")
SORT file.cday DESC
LIMIT 50
```

### Other Notes Mentions

_linked or tagged, excludes ~~daily notes~~_

```base
filters:
  and:
    - '!file.inFolder("daily-notes")'
    - '!file.inFolder("meeting-notes")'
    - file.hasLink(this.file)
formulas:
  Title: link(file.asLink(), title)
  Created: file.ctime.format("h:mm a - ddd, D MMM yyyy")
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - formula.Created
    sort:
      - property: file.ctime
        direction: DESC
    columnSize:
      formula.Title: 400

```

---

## Meetings

### Inline Meeting Notes

_use `type/meeting` and project link or tag_

```dataview
LIST
    L.text
FROM #type/meeting
FLATTEN file.lists as L
WHERE contains(L.text, "#type/meeting") AND (contains(L.text, "<%- slug %>") OR contains(L.text, "<%- titleCaseName %>"))
SORT file.cday DESC
LIMIT 10
```

### Dedicated Meeting Notes

_use meeting note with `project` key_

```base
filters:
  and:
    - file.inFolder("meeting-notes")
    - file.hasLink(this.file)
formulas:
  Title: link(file.asLink(), title)
  Created: file.ctime.format("h:mm a - ddd, D MMM yyyy")
views:
  - type: table
    name: Table
    order:
      - formula.Title
      - formula.Created
    sort:
      - property: file.ctime
        direction: DESC
    limit: 10
    columnSize:
      formula.Title: 400
```

