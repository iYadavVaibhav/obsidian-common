<%*
// Base Note Template
// - Makes filename as slug, title as Proper-Case
// - slug, titleCaseName available to use in template
// - project detection

// - Execution:
// - File created by clicking back-link will have a name, else it is "Untitled"
// - Prompts for title if filename starts with "Untitled"
// - Makes name title case, creates slug and renames file

// - Project Detection:
// - Auto-detects project from path, conditionally adds projectSlug, Hub back-link

// Get and clean title
let name = tp.file.title;
if (name.startsWith("Untitled")) {
    name = await tp.system.prompt("Enter note title") || "Unknown-" + tp.date.now("YYYY-MM-DD-HH-mm-ss");
}

// Create title case and slug
const titleCaseName = name.trim().replace(/\s+/g, ' ')
  .split(' ')
  .map(word => word.charAt(0).toUpperCase() + word.slice(1))
  .join(' ');

const slug = titleCaseName.toLowerCase()
  .replace(/[^a-z0-9]+/g, '-')
  .replace(/(^-|-$)/g, '')
  .substring(0, 32)
  .replace(/-$/, '');

// Rename file and get project
if (slug) await tp.file.rename(slug);
const projectSlug = tp.file.path(true).startsWith('projects') ? tp.file.path(true).split('/')[1] : null;

-%>
---
aliases: [<%- titleCaseName %>]
area: office
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
<%* if (projectSlug) { -%>
project: <%- projectSlug %>
<%* } -%>
status: review
title: <%- titleCaseName %>
type: general_note
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

<%* if (projectSlug) { -%>
up:: [Project Hub](hub-<%- projectSlug %>.md)
<%* } -%>

# <%- titleCaseName %>

- <% tp.file.cursor() %>

