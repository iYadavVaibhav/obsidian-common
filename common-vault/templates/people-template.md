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

### Projects

```dataview
LIST
FROM "projects"
WHERE contains(file.outlinks, [[]])
```

### Meetings

```dataview
TABLE file.cday as Created, summary AS "Summary"
FROM "meeting-notes" where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```

### Tasks

```tasks
not done
description includes <%- titleCaseName %>
```

### Mentions

```dataview
TABLE file.cday as Created, summary AS "Summary"
FROM !"meeting-notes" and !"people" where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```