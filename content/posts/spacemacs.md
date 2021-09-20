---
title: "Getting Started with Spacemacs/Emacs"
date: 2021-04-04T06:11:32+10:00
tags: [ "spacemacs", "emacs" ]
categories: [ "emacs" ]
---
## Prerequisites

[emacs]({{< relref "emacs.md#installation" >}})

```bash
yay -S adobe-source-code-pro-fonts
```

clone spacemacs repo and use develop branch

```bash
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d -b develop
```

clone zilongshanren layer and checkout develop branch

```bash
git clone https://github.com/yanboyang713/spacemacs-private.git ~/.spacemacs.d/
```

```console
[yanboyang713@boyang ~]$ gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40
gpg: key 066DAFCB81E42C40: "GNU ELPA Signing Agent (2019) <elpasign@elpa.gnu.org>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1
```


## Day 11
Topic: Spacemacs introduction and installation

### Why Spacemacs?
You have your own Emacs configuration and you have used it for a long time. My suggest: Try Spacemacs, use it and learn from it. Then consider to use Spacemacs daily or stick to your own Emacs config.
It’s a bundle of meta configs, it’s very easy to add/remove features & packages. The default package system is poor.
It’s very friendly for Vim users.(I’m not sure whether normal Emacs users like it or not.) But I know some people also use Emacs and Hybrid editing style.
It’s has a very nice UI(spaceline) and very active community. I know spaceline has some nasty bugs, but I still can’t resist to use it… it’s beautiful.
### Start to use Spacemacs today
Installation
choose editing style, I choose Vim
choose completion style, helm or ivy. We choose ivy and helm.
choose distribution, spacemacs or spacemacs-base
make your configs in .spacemacs.d folder and use Github to management it
Add some built-in layers
better defaults osx github git color markdown org javascript

little tweak
fullscreen
Exclude some unwanted packages
evil-lisp-state spray doc-view lorem-ipsum

Easy way to Add packages with default package settings
Add your own configs in user-config (Port the previous configs to Spacemacs)
Fix helm tramp mode issue
```emacs-lisp
(setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
```
Make customize-group configs in its own file
```emacs-lisp
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
```

monokai

Read the docs and Use Spacemacs every day!
## Spacemacs Config
Find the ~/.spacemacs file by pressing SPC f e d

## day 12 
### Creating a Spacemacs Layer
1. Create a new Spacemacs layer.
```bash
M-x configuration-layer/create-layer
```
2. Configuration layer path.
This will then give you the option of where to place the layer, but you can just use the default of **.spacemacs.d/layers/
3. Name of the layer.
4. Creating readme file or not.

## Day 13
Topic: More tweaks of your own layers

Fix ivy 0.8 issues
post-init and pre-init
location: builtin, elpa and github

github

```emacs-lisp
(gulpjs :location (recipe :fetcher github :repo "zilongshanren/emacs-gulpjs"))

(defun zilongshanren/init-gulpjs()
(use-package gulpjs
  :init))

```
layers.el

## Day 14
Topic: File and Buffer operations

** Talk the difference between the configs of mine and spacemacs

** File related operations
1. =SPC p f= (find a file in current project, it looks like the Ctrl-p plugin in Vim)

I also do some hacks to enhance the =SPC p f=

#+BEGIN_SRC emacs-lisp
(defun zilongshanren/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (zilongshanren/vcs-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (ido-find-file))))
#+END_SRC

If it is in a Git repository, I use =counsel-git= to find file. Why not projectile? Becuase I think ivy-mode is much faster.
If it is in a proctile project, say it has a =.projectile= file in your project's root.
Otherwise, you =ido-find-file=

2. =SPC f f= to find a file start from the current directory

3. =SPC f L= find the file across the whole Mac system

4. =SPC f l= find file literally(I also enhance this func with ffap)

5. =SPC f h= find file in hex mode(I also enhance this func with ffap)

6. =SPC f o= open with external program

7. =SPC f E= sudo edit

8. =SPC f D= delete current file and buffer

9. =SPC f j= open the current file's dired mode

10. =SPC f r= find the recent file with ivy

11. =SPC f R= rename the current file

12. =SPC f v= add local variables

13. =SPC f y= yank current buffer's full path

14. =SPC f a d= find the current visited directory with fasd.

15. =SPC f C d/u= convert file encoding between unix and dos

16. =SPC f e d= find the .spacemacs/.spacemacs.d/init.el file

17. =SPC f e i= find the .emacs/.emacs.d/init.el init file

18. =SPC f e l= helm locate library file

19. =SPC f c= copy file

20. =SPC f b= show bookmarks

21. =SPC f s/S= save buffers

** buffer related operations
1. =SPC b .= buffer micro state (hydra)
2. =SPC b b= switch buffers, i rebind it to =ivy-switch-buffer=, because I could see recent use file in buffer
3. =SPC b d= kill a buffer
4. =SPC b f= find buffer file in finder
5. =SPC b B/i= I bind it to ibuffer
6. =SPC b h= go to home
7. =SPC b k=  kill matching buffers
8. =SPC b N= new empty buffer
9. =SPC b m= kill others
10. =SPC b R= safe revert buffer
11. =SPC b s= switch to scratch buffer
12. =SPC b w= toggle buffer read-only
13. =SPC b Y=  copy the whole buffer to clipboard, the content could be used in other programs
14. =SPC b P= paste to the whole buffer
15. =SPC  <tab>= switch between the current buffer and the last opened buffer

** Sometimes I also use the =Dired= mode to do all the files operations
I think I have talked about it in the previous videos.

** Happy hacking!
