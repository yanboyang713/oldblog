---
title: "Getting Started with Org Roam - Build a Second Brain in Emacs"
date: 2021-09-02T06:11:32+10:00
tags: [ "spacemacs", "emacs", "org roam" ]
categories: [ "emacs" ]
draft: false
---
## Introduction
Org-roam is a plain-text knowledge management system. Org-roam is a tool for networked thought. It reproduces some of Roam Research’s 1 key features within Org-mode.

Org-roam borrows principles from the Zettelkasten method, providing a solution for non-hierarchical note-taking. It should also work as a plug-and-play solution for anyone already using Org-mode for their personal wiki.

Org-roam provides these benefits over other tooling:
+ **Privacy and Security**: Your personal wiki belongs only to you, entirely offline and in your control. Encrypt your notes with GPG.
+ **Longevity of Plain Text**: Unlike web solutions like Roam Research, the notes are first and foremost plain Org-mode files – Org-roam simply builds an auxiliary database to give the personal wiki superpowers. Having your notes in plain-text is crucial for the longevity of your wiki. Never have to worry about proprietary web solutions being taken down. The notes are still functional even if Org-roam ceases to exist.
+ **Free and Open Source**: Org-roam is free and open-source, which means that if you feel unhappy with any part of Org-roam, you may choose to extend Org-roam, or open a pull request.
+ **Leverage the Org-mode ecosystem**: Over the decades, Emacs and Org-mode has developed into a mature system for plain-text organization. Building upon Org-mode already puts Org-roam light-years ahead of many other solutions.
+ **Built on Emacs**: Emacs is also a fantastic interface for editing text, and Org-roam inherits many of the powerful text-navigation and editing packages available to Emacs.

## Installation
You can installing from MELPA or GitHub(Source). In this section, I will choose install Org-roam directly from the repository on GotHub. This will give you access to the latest version hours or days before it appears on MELPA, and months (or more) before it is added to the Debian or Ubuntu repositories. This will also give you access to various developmental branches that may be available.

Note, however, that development version, and especially any feature branches, may not always be in working order. You’ll need to be prepared to do some debugging, or to manually roll-back to working versions, if you install from GitHub.

First off, Spacemacs’ org layer includes the org-roam package, so we need to exclude it from org layer in dotspacemacs-configuration-layers:

```emacs-lisp
(org :packeges (not org-roam))
```

Then M-x configuration-layer/create-layer, and follow the instruction to name the layer, e.g. org-roam. This will create a layer folder with a file named “packages.el”.

Delete the content in the packages.el, and paste the following (my org-roam layer):

```emacs-lisp

(defconst Boyang-research-packages
  '(
    (org-roam :location
              (recipe :fetcher github
                      :repo "org-roam/org-roam"
                      :files (:defaults "extensions/*")))
    (org-roam-bibtex :location
                     (recipe :fetcher github :repo "org-roam/org-roam-bibtex"))
    )
  "The list of Lisp packages required by the Boyang-research layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun org-roam/init-org-roam ()
  (use-package org-roam
    :defer t
    :hook (after-init . org-roam-mode)
    :init
    (setq org-roam-v2-ack t)
    :custom
    (org-roam-directory "~/orgRoam") ;; please change it to your path
    :config
    (progn
      (spacemacs/declare-prefix "aor" "org-roam")
      (spacemacs/declare-prefix "aord" "org-roam-dailies")
      (spacemacs/declare-prefix "aort" "org-roam-tags")
      (spacemacs/set-leader-keys
        "aordy" 'org-roam-dailies-goto-yesterday
        "aordt" 'org-roam-dailies-goto-today
        "aordT" 'org-roam-dailies-goto-tomorrow
        "aordd" 'org-roam-dailies-goto-date
        "aor/" 'org-roam-node-find
        "aorc" 'org-roam-capture
        ;; "aorg" 'org-roam-graph
        "aorh" 'org-id-get-create
        "aori" 'org-roam-node-insert
        "aorl" 'org-roam-buffer-toggle
        "aorta" 'org-roam-tag-add
        "aortd" 'org-roam-tag-delete
        "aora" 'org-roam-alias-add)

      (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
      (spacemacs/declare-prefix-for-mode 'org-mode "mrd" "org-roam-dailies")
      (spacemacs/declare-prefix-for-mode 'org-mode "mrt" "org-roam-tags")
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "rb" 'org-roam-switch-to-buffer
        "rdy" 'org-roam-dailies-goto-yesterday
        "rdt" 'org-roam-dailies-goto-today
        "rdT" 'org-roam-dailies-goto-tomorrow
        "rdd" 'org-roam-dailies-goto-date
        "r/" 'org-roam-node-find
        "rc" 'org-roam-capture
        ;; "rg" 'org-roam-graph
        "rh" 'org-id-get-create
        "ri" 'org-roam-node-insert
        "rl" 'org-roam-buffer-toggle
        "rta" 'org-roam-tag-add
        "rtd" 'org-roam-tag-delete
        "ra" 'org-roam-alias-add))
    (setq org-roam-mode-sections
          (list #'org-roam-backlinks-insert-section
                #'org-roam-reflinks-insert-section
                ))
    (setq org-roam-file-extensions '("org"))
    (org-roam-setup)

    ;; templates
    (setq org-roam-capture-templates
          '(
            ("d" "default" plain
             "%?"
             :if-new (file+head "${slug}.org"
                                "#+title: ${title}\n")
             :immediate-finish t
             :unnarrowed t)
            ("r" "ref" plain
             "%?"
             :if-new (file+head "./ref_notes/${slug}.org"
                                "#+title: ${title}\n")
             :unnarrowed t)))
    (setq org-roam-dailies-directory "daily/")
    (setq org-roam-dailies-capture-templates
          '(("d" "default" entry
             "* %?"
             :if-new (file+head "%<%Y-%m-%d>.org"
                                "#+title: %<%Y-%m-%d>\n"))))
))

(defun org-roam/init-org-roam-bibtex ()
  (use-package org-roam-bibtex
    :after org-roam
    :hook (org-roam-mode . org-roam-bibtex-mode)
    :bind (:map org-mode-map
                (("C-c n a" . orb-note-actions)))))

```

## Creating your first node
Let's create our first node! We can use the **SPC aor/** binding to invoke org-roam-node-find which brings up a completion session to select or create a node.

Since we want to create a new node, we can type in the desired node name "test node" and press RET (Enter).

A new Org capture buffer will be created for the node. Why a capture buffer? Because Org Roam enables you to specify multiple capture templates for new notes in case you have different kinds of nodes you need to create!

```console
[yanboyang713@Boyang-PC orgRoam]$ ls
first_node.org  LICENSE  README.md  second_node.org
```
**NOTE:** These are just plain .org files inside of your notes folder! You can check them into a Git repository or sync them with any other tool you like. The database file that Org Roam creates does not need to be synced between machines because Org Roam can recreate it from existing .org files.

## Linking Nodes
### Inserting links to other nodes
The real power of Org Roam begins when you start linking your node files together! However, this works differently than normal Org links.

In an Org Roam buffer, we can use the **SPC aori** binding to invoke ***org-roam-node-insert*** which will bring up a completion list containing all of your nodes. Selecting one of them will cause a link to that node to be inserted at the point in the current buffer.

### Inserting links to nodes that don't exist yet
You can also type the name of a node that doesn't exist yet and it will be created!

Let's use **SPC aori** to insert a new node to see how this works.

This makes it much faster to build out your node graph!

## Creating a heading node
One of the new features of Org Roam v2 is the ability to turn a top-level heading inside of a node file into its own unique node. This can be helpful if some nodes don't really deserve their own files but you still want to link to them!

When you have your cursor in a top-level header in an Org Roam node buffer, run M-x org-id-get-create or use **SPC aorh** to assign an Org ID to the header. You will now see that header's name in the list of nodes displayed by **SPC aor/**.

## Creating aliases for nodes
What happens if you have top-level heading nodes in multiple files which have the same name?

Let's create another top-level heading node with same name and use org-id-get-create to give it an ID.

Now if we use **SPC aor/** to list all nodes, we see two same name nodes in the list! How can we tell them apart?

The way to solve this is to create an alias for one (or all) of the nodes with the same name. If you put your cursor on a heading node or in a file node, you can run M-x org-roam-alias-add or **SPC aora** . You will be prompted for the name of the alias to add.

```file
* test
  :PROPERTIES:
  :ID:       6f258b83-4809-47d7-b79f-7e92731168f3
  :ROAM_ALIASES: alias
  :END:
```

If you check the node listing with **SPC aor/** now, you will still see the duplicated names, but the alias you added will also be in the list!

If you need to, you can add multiple aliases for a single node.

## Viewing backlinks for the current file
Once you've started creating a lot of nodes that are linked together, it might be very helpful to open the backlinks buffer to see which notes are linked to the node you are currently viewing.

Let's open the one node and then press **aorl** to execute the org-roam-buffer-toggle command. A new buffer called *org-roam* will be created in a new window.

Now any time you select a buffer for an Org Roam node, you will see the list of references to that node from any other nodes. 

## Reference List
1. https://www.youtube.com/watch?v=AyhPmypHDEw&t=688s
2. https://org-roam.discourse.group/t/v2-and-spacemacs/1676
3. https://org-roam.discourse.group/t/orb-helm-bibtex-open-notes-wont-create-new-note/690
4. https://www.lucacambiaghi.com/posts/discovering-org-roam.html
5. https://www.orgroam.com/manual.html
