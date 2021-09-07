---
title: "An introduction to Magit, an Emacs mode for Git"
date: 2021-09-02T06:11:32+10:00
tags: [ "spacemacs", "emacs", "magit" ]
categories: [ "emacs" ]
draft: true
---

## Introduction
[Magit](https://magit.vc/) is arguably the best Git tool out there and also my favorite. It is a package in Emacs, and it is text based.
## Magit init, commit and commit messages

### Init create a repositories from a floder
SPC g i(magit-init)
### Add all of files to staged
SPC u S
### Checking staged files changed contect
Move cursor to staged files, click TAB check what is changed
### Commit
c c then use c-c c-c to finish commit
### Open Magit Ststus
SPC g s(magit-status)
s-1 (goto unstaged section) - does not working
s to stage changes in a sigle file - cursor in single file
if cursor in Untracked files, type s will stage all of files.

press tab to view diffs in staged file

editing the commit message and the diff on the right


## Commits in Action
1. Ammend ( c a)
ammend mean add new change to last commit.

write good commit messages
commit summary msg could not long than 72 char (first line)
if you add more commit msg, skip a line to write more details

check commit log (l l), type Enter to check commit details

squash unpushed commits (r l)
http://www.howardism.org/Technical/Emacs/magit-squashing.html

reset commits (l l #)
select a few line to commits
discard changes, file wide or line wide
revert commits

## pull, push & send Pull request
P P
f f / f o to fetch branch
F to pull
s-g to send pull request

## push
### add remote
M a ( (magit-remote-add))
Enter name and URL
### set upstream
p u


**TIPS:** when you want to paste into minibuffer, C-y

128 git … push -v --set-upstream origin master\:refs/heads/master
Pushing to https://github.com/yanboyang713/testMagit.git
Username for 'https://github.com': Password for 'https://yanboyang713@github.com': 
remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.
remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information.
fatal: Authentication failed for 'https://github.com/yanboyang713/testMagit.git/'


## R eference List
1. https://github.com/emacs-china/Spacemacs-rocks/tree/master/Season1#magit-workflow
2. https://www.lvguowei.me/post/magit-rebase/
3. https://www.lvguowei.me/post/magit-rebase-2/

