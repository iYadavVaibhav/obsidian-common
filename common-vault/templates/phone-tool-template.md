---
name: {{phonetool_name}}
aliases: [{{phonetool_login}}@] 
login: {{phonetool_login}}@
role: {{phonetool_job_title}}
level: {{phonetool_job_level}}
email: {{phonetool_email}}
phone: {{phonetool_mobile_number}}
manager_login: {{phonetool_manager_login}}@
title: {phonetool_name}} - {{phonetool_login}}@
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# {{phonetool_name}} - {{phonetool_login}}@

_{{phonetool_job_title}}_

## Notes

## Links

- [PhoneTool](https://phonetool.amazon.com/users/{{phonetool_login}})
- Added on: [{{date}}](daily-notes/{{date}})

---

_anything below is automated_

## Projects

```dataview
LIST
FROM "projects"
WHERE contains(people, "{{phonetool_name}}")
```

## Meetings

```dataview
TABLE file.cday as Created, summary AS "Summary"
FROM "meeting-notes" where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```

## Tasks

```tasks
not done
description includes {{phonetool_login}}@
```

## Mentions

```dataview
TABLE file.cday as Created, summary AS "Summary"
FROM !"meeting-notes" where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```
