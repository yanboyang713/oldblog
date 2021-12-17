# Getting Started Org-mode on Emacs


## Introduction {#introduction}

Org mode is an artifact under Emacs. Compared with the lightweight format of markdown,
It has more functions and expandability, but it is still difficult to get started.
Here is only a brief introduction to some of the basic functions.


## Pre-reading {#pre-reading}

1.  [Emacs/Getting Started with Doom Emacs :Emacs:Doom-Emacs:]({{< relref "doom" >}})


## Fundamental Feature {#fundamental-feature}


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

For display image is similar:

```text
[[file:/home/path_of_pics]]
[[./pics/file.jpg]]
```


## font settings {#font-settings}

```text
*bold*
/italic/
_underlined_
=code=
~verbatim~
+striken-through+
```


## Footnote {#footnote}

Here is an example of Footnotes.

```text
[fn:name] The link: https:yanboyang.com
Boyang Yan's Blog[fn:name]
```

Can be inserted through **C-c C-x f**, and footnote jump to the definition **C-c C-c**

The specific content is&nbsp;[^fn:1],&nbsp;[^fn:2] and&nbsp;[^fn:1].


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


## Text format output {#text-format-output}

The text format output needs to be run in different modes, generally obtained by the form of **&lt;+char+Tab** completion, such as **&lt;s+Tab**

Different characters in different text forms are defined as follows:

```text
s       #+BEGIN_SRC ... #+END_SRC

e       #+BEGIN_EXAMPLE ... #+END_EXAMPLE

q       #+BEGIN_QUOTE ... #+END_QUOTE

v       #+BEGIN_VERSE ... #+END_VERSE

c       #+BEGIN_CENTER ... #+END_CENTER

C       #+BEGIN_COMMENT ... #+END_COMMENT

l       #+BEGIN_EXPORT latex ... #+END_EXPORT

L       #+LATEX:

h       #+BEGIN_EXPORT html ... #+END_EXPORT

H       #+HTML:

a       #+BEGIN_EXPORT ascii ... #+END_EXPORT

A       #+ASCII:

i       #+INDEX: line

I       #+INCLUDE: line
```

Here are examples:

```text
Set title and the table of content:
# +TITLE: This is the title of the document
# +OPTIONS: toc:2 (only to two levels in TOC)
# +OPTIONS: toc:nil (no TOC at all)

Add quote：
# +BEGIN_QUOTE
Everything should be made as simple as possible,
but not any simpler -- Albert Einstein
# +END_QUOTE

Set to center：
# +BEGIN_CENTER
    Everything should be made as simple as possible,but not any simpler
# +END_CENTER

Set Example (The content inside will be output directly):
# +BEGIN_EXAMPLE
The text will be output directly, NOT tranfer the others form.
# +END_EXAMPLE

Write Comment (The content inside will NOT output)
# +BEGIN_COMMENT
The content inside will NOT export.
# +END_COMMENT
```


## Post-reading {#post-reading}

1.  [Emacs/Best practices for using Emacs org-mode as a day-planner/scheduler/calendar]({{< relref "orgPlanning" >}})
2.  [Emacs/Using Emacs Org-Babel Mode to Write Literate Programming Documents]({{< relref "orgBabel" >}})


## Reference List {#reference-list}

1.  <https://blog.csdn.net/sunny0660/article/details/104078734>

[^fn:1]: a definition
[^fn:2]: This is the inline definition of this footnote

