---
title: "Building a Second Brain"
date: 2021-12-07T10:18:00-05:00
tags: ["second", "brain", "org", "mode", "emacs"]
categories: ["Research"]
draft: false
subtitle:: "Capturing, Organizing, and Sharing Knowledge for Scholars and Researchers"
---

## Introduction {#introduction}

Building a Second Brain is about creating a reliable system – outside your physical skin-and-bone bodily boundaries – for storing, organising, digesting, and eventually transforming information into Good Creative Output.

Much like any well-integrated tool, I am currently using **Emacs Org Mode** as Second Brain **core** tool. This system also includes many other peripheral components that make up the complete **Second Brain** system.

I will follow the below overview diagram introducte each components one by one.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1638851036/research/orgmode2_firjld.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1638851036/research/orgMode_asb3an.png" >}}


## Pre-reading {#pre-reading}

1.  [Emacs/Getting Started with Doom Emacs]({{< relref "doom" >}})


## Org-mode modules {#org-mode-modules}


### Planning {#planning}

-   Task management (pomodoro method; time-blocking)
-   Time management (appointments; time-blocking)


#### TODO’s and tags {#todo-s-and-tags}

-   These are identifiers in an org-file as tasks or reminders.
-   The types of TODO’s can either be set globally in your init file, or they can be file/buffer specific.
-   They are created as a subtree (think ‘heading’), or in-line ('org-inlinetask).
-   You can assign deadlines, scheduled date and time, active timestamps, and inactive timestamps


#### Org-capture {#org-capture}

These are customizable org-headings that you can create on-the-go.
They can be regular TODO’s or just notes.


#### Org-agenda {#org-agenda}

Populates all your TODO’s and appointments into a singular view.
Default is week-view.
Using org-super-agenda, I set up my agenda as a daily view with
appointments, deadlines, and a habit tracker.


#### Org-sidebar {#org-sidebar}

Another way of accessing your TODO’s that are outside of your agenda. I
am using it to keep my project-specific TODO’s in the main project org
file.


### Writing {#writing}


#### org-roam {#org-roam}

A note-taking package that replicates Roam Research which is based on
the Zettelkasten method. I use it to build my literature review and I use
org-roam-server to visualize my notes into a network.
It builds on the strength of org-mode’s hyperlinking properties.


#### Org-roam-bibtex {#org-roam-bibtex}

Utilizes a combination of org-ref, helm-bibtex, and
bibtex-completion to streamline note-taking workflow with references
within the org-roam ecosystem.


#### Org-noter {#org-noter}

I use it to annotate PDFs and take notes within the same buffer.

-   Works extremely well with PDF-tools.
-   org-noter-create-skeleton


#### Org-transclusion {#org-transclusion}

An effective way of “copy/pasting” text from one org file (let’s say
an org-roam note or a section of your thesis/dissertation) into your
main org file.
It will export all the transcluded text.
Sort of equivalent to “#+INCLUDE:”


### Reference Management {#reference-management}

[Research/Getting Started with Zotero]({{< relref "zotero" >}})
