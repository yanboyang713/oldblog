# Getting Started Org-mode on Emacs


## Introduction {#introduction}

Org mode is an artifact under Emacs. Compared with the lightweight format of markdown,
It has more functions and expandability, but it is still difficult to get started.
Here is only a brief introduction to some of the basic functions.


## Pre-reading {#pre-reading}

1.  [Emacs/Getting Started with Doom Emacs :Emacs:Doom-Emacs:]({{< relref "doom" >}})


## Fundamental Ffeature {#fundamental-ffeature}


### Headings {#headings}

org-mode uses \* to indicate headings, and the number of \* to indicate heading level:

```text
* First level heading
** Secondary heading
*** Level 3 heading
```

1.  Use the **Control-[RET]** key to insert the title of the same level, and you can use the **Alt-left/right** title to increase and decrease the level
2.  Using **Alt-Up** and **Alt-Down** swap the **Headings** content Up and Down (including sub-chapters).
3.  You can use the **Tab** key to expand and collapse the headings, and the **Shift+Tab** key to expand and collapse all chapters.


## List {#list}

The **List** includes two types:

1.  Unordered list

    ```text
    ​   + list
    ​   + list
    ​       + sub-list
    ```

2.  Ordered list

    ```text
       1. list
       2. list
           1. sub-list
    ```


## Link {#link}

Here is an example of Link.

```text
[[URL][description]]
[[https://yanboyang.com][Boyang Yan's blog]]
```

**NOTE**: After inputting, the GUI display will change, edit through **C-c C-l**


## Table {#table}

The Org-mode table is implemented in the following format:

```text
| name     |   phone | job     | score1 | score2 | total |
|----------+---------+---------+--------+--------+-------|
| Zhangsan | 1234455 | student |     19 |     30 |    49 |
| Lisi     |  423423 | layer   |     20 |     10 |    30 |
#+TBLFM: $6=$4+$5
```

You need to set the number of columns in the first row, and the **Tab** key can complete to the next grid (next row)

**|-** can be completed to get **|----------~~---------~~---------|**

The total column can be automatically summed in the form of = /$4+/$5 and executed as **C-c C-c**


## Checkbox {#checkbox}

It often great to split a task into a number of simple steps. Or you can use them in a shopping list.

The form is [], put in front of the task can mark the completion status of the task, Put it after the task to mark the completion degree of the task, which needs to add% or /

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

1.  **M-S-RET** (org-insert-todo-heading) **M** is ALT on my system
    Insert a new item with a checkbox. This works only if point is already in a plain list item
2.  **C-c C-c** (org-toggle-checkbox)
    Toggle checkbox status or—with prefix argument—checkbox presence at point. With a single prefix argument, add an empty checkbox or remove the current one50. With a double prefix argument, set it to ‘[-]’, which is considered to be an intermediate state.


## Reference List {#reference-list}

1.  <https://blog.csdn.net/sunny0660/article/details/104078734>

