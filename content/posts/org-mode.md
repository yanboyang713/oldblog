---
title: "Getting Started Org-mode on Emacs"
date: 2021-12-15T11:29:00+08:00
tags: ["Emacs", "org"]
categories: ["Emacs"]
draft: false
---

## Introduction {#introduction}

Org mode is an artifact under Emacs. Compared with the lightweight format of markdown,
It has more functions and expandability, but it is still difficult to get started.
Here is only a brief introduction to some of the basic functions.


## Pre-reading {#pre-reading}

1.  [Emacs/Getting Started with Doom Emacs :Emacs:Doom-Emacs:]({{< relref "doom" >}})


## Fundamental Function {#fundamental-function}


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


## Reference List {#reference-list}

1.  <https://blog.csdn.net/sunny0660/article/details/104078734>
