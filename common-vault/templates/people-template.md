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


## Recent Meetings

```dataview
LIST WITHOUT ID
	link(file.path, title) + " - " + file.ctime
FROM "meeting-notes"
WHERE contains(file.outlinks, this.file.link)
SORT file.ctime DESC
LIMIT 5
```

## Inline Meeting Notes

```dataview
LIST
    L.text
FROM #type/meeting
FLATTEN file.lists as L
WHERE contains(L.text, "#type/meeting") AND (contains(L.text, "<%- slug %>") OR contains(L.text, "<%- titleCaseName %>"))
SORT file.cday DESC
LIMIT 10
```

## Active Tasks

```tasks
not done
description includes <%- slug %>
```

## Daily Note Mentions

```dataview
LIST
    L.text
FROM "daily-notes"
FLATTEN file.lists as L
WHERE (contains(L.text, "<%- slug %>") OR contains(L.text, "<%- titleCaseName %>")) AND !contains(L.text, "#type/meeting")
SORT file.cday DESC
LIMIT 10
```

## Linked Notes

_linked, not in daily notes_

```dataview
LIST WITHOUT ID
link(file.path, title)
from !"daily-notes" AND !"meeting-notes"
where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```
