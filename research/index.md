# Getting Started reproducible research with GNU Emacs


## Introduction

## Prerequirements

## Notes
The idea is to be able to create notes for all kinds of content. Specifically, papers or books, along with webpages. This then requires a separate system for each which is described by:

### Search Engine
The search engine is key, both in terms of accessibility and scalability. It is assumed that there will be many notes, and that they will have a wide variety of content. The search interface must then simply allow us to narrow down our candidates in a meaningful manner.
### Contextual Representation
This aspect of the workflow deals with representations, which should transcend the usage of tags or categories. In particular, it would be nice to be able to visualize the flow of ideas, each represented by a note.
### Backlinks
In particular, by backlinks at this point we are referring to the ability to link to a pdf or a website with a unique key such that notes can be added or removed at will.
### Storage
Not actually part of the workflow in the same way, since it will be handled at the system level, it is worth nothing, that in this workflow Zotero is used to export a master bib file and keeps it updated, while the notes themselves are version controlled5.
The concepts above will be handled by the following packages.

Concept	Package	Note
Search	deft	Has a great interface
Context	org-roam	Allows the export of graphiz mindmaps
Backlinks	org-roam, org-ref, org-noter	Covers websites, bibliographies, and pdfs respectively

A key component in this workflow is actually facilitated by the fabulous org-roam-bibtex or ORB. The basic idea is to ensure meaningful templates which interpolate smoothly with org-roam, org-ref, helm-bibtex, and org-capture.

## Reference List
1. https://github.com/nalhasan/emacsconf2020
2. https://emacsconf.org/2020/talks/17/
3. https://rgoswami.me/posts/org-note-workflow/
4. https://blog.jethro.dev/posts/how_to_take_smart_notes_org/
5. https://lucidmanager.org/productivity/emacs-bibtex-mode/

