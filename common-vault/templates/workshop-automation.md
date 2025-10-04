<%*
let prompt = "Enter workshop title";

let name = await tp.system.prompt(prompt);

if (!name) name = "Untitled-" + tp.date.now("YYYYMMDD-HHmmss");

// Trim and replace multiple consecutive spaces with single spaces
name = name.trim().replace(/\s+/g, ' ');

// Create title case name
const titleCaseName = name.replace(/\b\w/g, c => c.toUpperCase());

let slug = titleCaseName.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');

if (slug.length > 32) {
    slug = slug.substring(0, 32).replace(/-$/, '');
}

// Create workshop folder
const workshopFolder = `workshops/${slug}`;
await app.vault.createFolder(workshopFolder).catch(() => console.log("Folder already exists"));

// move file
await tp.file.move(`${workshopFolder}/0-${slug}`);

_%>

---
aliases: [<%- titleCaseName %>]
area: 
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
status: todo
title: <%- titleCaseName %>
type: workshop_hub
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

up:: [Workshops Hub](workshop-hub.md)

# <%- titleCaseName %>


