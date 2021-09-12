---
title: "An introduction to Magit, an Emacs mode for Git"
date: 2021-09-02T06:11:32+10:00
tags: [ "spacemacs", "emacs", "magit" ]
categories: [ "emacs" ]
draft: false
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

## Rebase
Let’s create an empty repository and add one empty file to it.

```bash
git init
touch file.txt
git add .
git commit -m 'first commit'
```

### Rewording commit
Now let’s add some fruits in the file. Open the file and add a new line
```file
apple
```

Open Magit, commit the change with a message says

```file
Add apple
```

Then add a new line

```file
pear
```

with commit message

```file
apple again, wrong commit message
```

Then add a new line

```file
peach
```

with a commit message

```file
peach
```

Now it is clear that we need to fix the second commit message. But since this is not the last one we cannot use **git commit --amend**. But we can still use **rebase** to change it.

In Magit, press **ll** to open the log history. Put the cursor under the wrong commit.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631017008/git/Rewording_s2foua.png)

Then press **r(rebase)** and **w(to reword a commit)**.
Now enter the correct commit message pear and press **C-c C-c**. Now you should see the commit messages updates.

### Squashing commits
It appears that the last 3 commits should really be 1 commit with a message like add fruits. We can use rebase to squash them into one commit like this:

In the commit history, put the cursor on the oldest of the 3 commits that we want to squash, and press **r(rebase)** **i(interactively)**. We now see the interactive rebase page.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631017472/git/Squashing_nfufkr.png)

The good thing about this page is that it contains a cheatsheet already, so you can just see what kind things can be done here.

Notice that the order of the commits now is reversed, the latest commit being at the bottom.

As the cheatsheet says, we can put the cursor on the pear commit and press s, this means that we want this commit to be squashed into its previous commit. And then we do the same for the peach commit.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631017669/git/Squashing2_rfht8t.png)

We can see that the two commits are marked as squash now, then we can press C-c C-c to make the squash happen. It will prompt you to enter the new commit and also hint you the previous commit messages. Type Add fruits and press C-c C-c.

Now we can see from the history that the 3 previous commits become one now.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631017873/git/Squashing3_zchjry.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631018028/git/Squashing4_n9ry27.png)

### Splitting commit (does NOT work yet)
It will come at times that we want to split a big commit into smaller ones. This can also be achieved by using rebase.

Let’s add a new file file2.txt and modify the file.txt to add some animal names. Commit the changes with message add animals to file and create file2. So we want to split this commit into 2 commits, one for adding animals and one for creating file2.

As always, we go to the commits history page, put the cursor on the last commit, and press r, then press m(to edit a commit).

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631018477/git/Splitting1_ij6vvu.png)

Notice that there is a @ sign in front of the commit, meaning the HEAD now is at this commit. And then, we want to move the HEAD one step before the current by git reset. Move the cursor to previous commit Add fruits and press x, then choose master. Now go back to the main screen you should see this:

**TIPS:** You can switch between Vim and Emacs per buffer with C-z
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631019252/git/Splitting2_i6p9cr.png)


## Reset commits
ll #

## Revert commits

## Branching Basics
b B to create branch

m m to merge

b b to switch branch


## Reference List
1. https://github.com/emacs-china/Spacemacs-rocks/tree/master/Season1#magit-workflow
2. https://www.lvguowei.me/post/magit-rebase/
3. https://www.lvguowei.me/post/magit-rebase-2/

