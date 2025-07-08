<%*
let name = await tp.system.prompt("Enter object name");
if (!name) name = "Unnamed";

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
    await tp.file.move("/physical-objects/" + tp.date.now("YYYY-MM-DD-ddd-") + slug);
}
-%>
---
aliases: [<%- titleCaseName %>]
area: personal
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
price: 
purchased: <% tp.date.now("YYYY-MM-DD") %>
slug: <%- slug %>
status: review
title: <%- titleCaseName %>
type: physical_object
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
url:
---

up:: [Physical Objects Hub](physical-objects-hub.md)

# <%- titleCaseName %>

### Notes

 -
