---
name: {{title}}
aliases: [{{title}}] 
role: 
company: 
email: 
phone: 
type: person
status: active
area: social
---

%% non amazonian template %%

# {{title}}

_{{title}}_

## Notes

- 

---

_anything below is automated_

## Projects

```dataview
LIST
FROM "projects"
WHERE contains(people, "{{title}}")
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
description includes {{title}}@
```

## Mentions

```dataview
TABLE file.cday as Created, summary AS "Summary"
FROM !"meeting-notes" where contains(file.outlinks, this.file.link)
SORT file.cday DESC
```
