---
title: "Best practices for using Emacs org-mode as a day-planner/scheduler/calendar"
date: 2021-12-16T18:28:00+08:00
tags: ["Emacs", "org", "planning"]
categories: ["Emacs"]
draft: false
---

## Pre-reading {#pre-reading}

1.  [Emacs/Getting Started Org-mode on Emacs]({{< relref "org-mode" >}})


## Checkbox {#checkbox}

It often great to split a task into a number of simple steps. Or you can use them in a shopping list.

The form is [], put in front of the task can mark the completion status of the task, Put it after the task to mark the completion degree of the task, which needs to add % or /

Here is an example of a checkbox list.

```text
call people [1/3]
    - [ ] Peter
    - [X] Sarah
    - [-] Sam [50%]
      + [X] topic 1
      + [ ] topic 2
```

**NOTE**:

1.  **M-S-RET** (org-insert-todo-heading) **M** is ALT on my system.

    Insert a new item with a checkbox. This works only if point is already in a plain list item
2.  **C-c C-c** (org-toggle-checkbox)
    Toggle checkbox status or—with prefix argument—checkbox presence at point. With a single prefix argument, add an empty checkbox or remove the current one50. With a double prefix argument, set it to ‘[-]’, which is considered to be an intermediate state.
