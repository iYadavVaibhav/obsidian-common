<%*
let name = await tp.system.prompt("Enter meeting title");
if (!name) name = "Unknown";

name = name.trim().replace(/\s+/g, ' ');
const titleCaseName = name
  .toLowerCase()
  .split(' ')
  .map(word => word.charAt(0).toUpperCase() + word.slice(1))
  .join(' ');

let slug = titleCaseName.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
if (slug.length > 32) {
    slug = slug.substring(0, 32).replace(/-$/, '');
}

if (slug) {
    await tp.file.move("/meeting-notes/" + tp.date.now("YYYY/MM-MMM/YYYY-MM-DD-ddd") + "-" + slug);
}
-%>
---
aliases: [<%- titleCaseName %>]
area: office
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
slug: <%- slug %>
status: review
summary: " "
title: <%- titleCaseName %>
type: meeting
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# <%- titleCaseName %>

up:: [Meeting Hub](meetings-hub.md)
Date: [[<% tp.date.now("YYYY-MM-DD-ddd") %>]]

**Attendees**: 
- 

## Agenda/Questions
- 

## Notes
- 

