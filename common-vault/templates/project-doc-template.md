---
title: Doc - <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project
type: project_doc
project: <% tp.file.folder(true).split('/').pop() %>
aliases: [<% tp.file.folder(true).split('/').pop() %>]
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
description: ''
---

# Doc - <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %> Project

_central doc for project_

[Hub <% tp.file.folder(true).split('/').pop().replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase()) %>](hub-<% tp.file.folder(true).split('/').pop() %>.md) - Back to Hub

## Tasks

## Ideas

## Notes

_meetings, tasks, notes, decisions_

## Links
