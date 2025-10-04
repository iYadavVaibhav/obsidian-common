<%*
let name = tp.file.title;
let custom_date = tp.date.now();

if (name.startsWith("Untitled")) {
    let dateInput = await tp.system.prompt("Enter date in YYYYMMDD format:");
    custom_date = moment(dateInput, "YYYYMMDD");
    let newFileName = custom_date.format("YYYY-MM-DD-ddd");
    await tp.file.move("/daily-notes/" + custom_date.format("YYYY/MM-MMM/") + newFileName);
}
else {
    custom_date = moment(name, "YYYY-MM-DD-ddd");
}
-%>
---
aliases: ["<% custom_date.format("ddd, DD MMM YYYY") %>"]
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
status: review
title: <% custom_date.format("ddd, DD MMM YYYY") %>
type: daily_note
updated: <% tp.date.now("YYYY-MM-DD HH:mm") %>
---

# <% custom_date.format("ddd, DD MMM YYYY") %>

<< [<% moment(custom_date).subtract(1, 'day').format("YYYY-MM-DD-ddd") %>](daily-notes/<% moment(custom_date).subtract(1, 'day').format("YYYY/MM-MMM/YYYY-MM-DD-ddd") %>.md) | [<% moment(custom_date).add(1, 'day').format("YYYY-MM-DD-ddd") %>](daily-notes/<% moment(custom_date).add(1, 'day').format("YYYY/MM-MMM/YYYY-MM-DD-ddd") %>.md) >>

- <% tp.file.cursor() %>

- What have you accomplished?
    - 

- What could had been better?
    - 

---

### Tasks from Yesterday

```dataview
TASK
FROM "daily-notes/<% moment(custom_date).subtract(1, 'day').format("YYYY-MM-DD-ddd") %>"
WHERE !completed
```

### Tasks Due Today

```tasks
due on <% custom_date.format("YYYY-MM-DD") %>
```

### Overdue Tasks

```tasks
not done
due before <% custom_date.format("YYYY-MM-DD") %>
```

### Notes Created Today

```dataview
LIST WITHOUT ID link(file.link, title) FROM "" WHERE file.cday = date("<% custom_date.format("YYYY-MM-DD") %>") SORT file.ctime ASC
```

### Notes Updated Today

```dataview
LIST WITHOUT ID link(file.link, title) FROM "" WHERE file.mday = date("<% custom_date.format("YYYY-MM-DD") %>") SORT file.mtime asc
```