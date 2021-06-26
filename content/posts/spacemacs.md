---
title: "Getting Started with Spacemacs/Emacs"
date: 2021-04-04T06:11:32+10:00
tags: [ "spacemacs", "emacs" ]
categories: [ "emacs" ]
---
## Installation
### Run Emacs in Docker
https://github.com/Silex/docker-emacs
#### Usage
##### Console
```console
docker run -it --rm silex/emacs
```
##### GUI
```console
xhost +local:root # WARN: this comes with security issues
docker run -it --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix silex/emacs
```

### Arch Linux (Manjaro)
```bash
yay -S emacs
```

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

## Go over the Emacs tutorial at least once
- C-h t to open the tutorial.
- You should be familiar with M(meta), s(uper, command key), S(hift) and C(trl)
- You need be familiar with cursor movement (C-f/C-b/C-n/C-p/C-a/C-e) and basic editing (C-k)
- Prefix key (C-h) and C-g (Stop currently input)

## Learn to active some built-in functionality
- linum-mode to display line numbers (M-x linum-mode)
- C-x C-f(find/file) to open files, C-x C-s(ave) to save files.
- You should always ask Emacs the right question
- C-h k(ey)/ C-h v(arable)/ C-h f(unction) (Emacs is a self document, extensiable editor)
- The key bindings are actually a quick way to command Emacs.

## Learn some elisp (emacs lisp)
- Use [learnxinyminutes](https://learnxinyminutes.com/docs/elisp/) website to learn Emacs lisp.
- at least you know how to define variable, functions
```lisp
(setq my-name "Boyang Yan")
(message my-name)

(defun my-func ()
(interactive)
(message "hello, %s" my-name))
```
- how to make a function callable (add keyword (interactive)) and how to set a key binding for the function.

```lisp
(global-set-key (kbd "<f2>") 'my-func)
```

C-x C-e(xection) lisp code
C-h m(ode) check Enabled Minor Mode

## Start to hacking Emacs from the day one!
All of emacs confige file, You can put into ~/emacs.d/init.el

+ Turn off tool-bar
```lisp
(tool-bar-mode -1)
```
+ Turn off scroll-bar
```lisp
(scroll-bar-mode -1)
```
+ show linum-mode
```lisp
(linum-mode t)
(global-linum-mode t)
```
+ turn off splash screen
```lisp
(setq inhibit-splash-screen t)
```
+ Save your confige
+ define a function to quickly open your config file
```lisp
(defun open-my-init-file()
(interactive)
(find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
```

```lisp
(recentf-mode t)
```

## Emacs package system in the first glance.
+ How to use the build-in Package system of Emacs.
Options -> Mangage Emacs Package -> search -> install
+ Install company mode and active it.
```console
M-x company-mode
```

```lisp
(global-company-mode t)
```
+ Major mode and Minor mode (C-h m)
Only allow one Major mode. Each file will and must have one Major Mode 

+ Bonus (org-mode basics)
- use * to define headings
- C-c C-t to toggle TODO states
GTD (getting things done)

## Day Two
```lisp
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)
```

**NOTE:**
The different between setq and setq-default
https://stackoverflow.com/questions/18172728/the-difference-between-setq-and-setq-default-in-emacs-lisp

disable backup file
```emacs-lisp
(setq make-backup-files nil)
```

NOTE: use C-c ’ (C-c and sigle quota) to open another buffer to edit source code. Make source code fancy in the org file.
```lisp
(require 'org)
(setq org-src-fontify-natively t)
```

enable recentf-mode
```emacs-lisp
(require 'recentf)
(recentf-mode 1)			
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
```
NOTE: require mean load it from FILENAME.

M-x eval-buffer for execute all of lisp'code in buffer.

add delete selection mode
```lisp
(delete-selection-mode t)
```

Make Emacs more fancy
1. Open with full screen
```lisp
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
```

2. show match parents
```lisp
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
```
**NOTE:** add-hook mean run show-pareb-mode after emacs-lisp-mode

3. Highlight current line (global-hl-line-mode)
```lisp
(global-hl-line-mode t)
```

### Improve built-in package system
make package system more powerful with [Melpa](https://melpa.org/)

```lisp
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)

;;add whatever packages you want here
(defvar zilongshanren/packages '(
                          company
                          monokai-theme ;; install monokai-theme
                          hungry-delete ;; install hungry-delete
                          smex
                          swiper
                          counsel
                          smartparens
                      
              )  "Default packages")

(setq package-selected-packages zilongshanren/packages)

(defun zilongshanren/packages-installed-p ()
  (loop for pkg in zilongshanren/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (zilongshanren/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zilongshanren/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
      
```

install a theme (monokai)
```lisp
(load-theme 'monokai t)
```
install hungry delete mode
```lisp
(require 'hungry-delete)
(global-hungry-delete-mode)
```

package-list-packages (add/delete/update packages)
```console
M-x package-list-packages
```
add **i**
delete **D - > X**
update **U**

install and configure counsel and ivy mode(swiper)

https://github.com/abo-abo/swiper/tree/040d458bce4a88f37359192061bcea5ebe87007c

swiper for search by text in minibuffer C-s
find-file C-x C-f

```lisp
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
```

use customize-group to customize the package settings
```console
M-x customize-group
```

```lisp
custom-set-variable
```

install and configure smartparens mode
Smartparens is a minor mode for dealing with pairs in Emacs.
It can automatically insert pairs
```lisp
(require 'smartparens-config)
;;You can now use smartparens with M-x smartparens-mode.
(smartparens-global-mode t)
```


Don’t try to update the package daily, the updating process might failed.
(tips: press M-RET to fix the order, you could also use M-RET to add new headings, cheers!)
1. xection
2. daily
4. ocker
5. ach

1. xection
2. daily
4. ocker
5. ach

### Setup a javascript IDE
Install js2-mode and start to write javascript
```lisp
(setq auto-mode-alist
(append
'(("\\.js\\'" . js2-mode))
auto-mode-alist)
```
Install nodejs-repl to execute code inside Emacs
 exec-path-from-shell

### Learn more from Emacs itself
c-h c-f(find-function), c-h c-v(find-variable), c-h c-k(find-function-on-key)
Tell users to learn more about elisp(M-x info)

### Org-mode(Bonus Time)
Agenda files and agenda view
one gtd.org file
```lisp
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
```
Learn how to schedule items and set deadline
c-c c-s to schedule item
c-c c-d to set deadline of item.

## Day 3
help window is anoyying..
```lisp
;; add popwin mode
;; why this line is needed
(require 'popwin) (require 'init-packages)
   ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)
```

1. load-file, load-path and load
2. features, provide and require, autoload

C-h v

3. naming conventions
all of the names should have a prefix, such that the naming conflicts could be minimal. All of variable is global variable
zilongshanren/xxxx minor mode or major mode. niubi-mode niubi-xxx

4. define your abbrevs
```lisp
(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(
                                            ;; signature
                                            ("8zl" "zilongshanren")
                                            ;; emacs regex
                                            
                                            ))
```

5. how to organize your configs
Put all of your into a new folder, such as **lisp**
1. init-packages.el
at the end of file
```lisp
(provide 'init-packages)
```
2. init-ui.el
3. init-better-defaults.el
4. init-keybindings.el
5. custom.el

In your init.el file
```lisp
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
```

```lisp
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)
```

use `counsel-git` to find file in git managed project.
(global-set-key (kbd "C-c p f") 'counsel-git)

Major mode and minor mode in details
conventions
text-mode/special-mode/prog-mode naming: xxx-mode, xxx-mode-key-map xxx-mode-hook

# Day 4
load, load-file, require, provide and auto-load

## Better defaults
Indent-region or buffer
```lisp
  (defun indent-buffer ()
    "Indent the currently visited buffer."
    (interactive)
 reveal-in-osx-finder   It is bound to RET, a.
(indent-rSpacemacsegion (point-min) (point-max)))

  (defun indent-region-or-buffer ()
    "Indent a region if selected, otherwise the whole buffer."
    (interactive)
    (save-excursion
      (if (region-active-p)
          (progn
            (indent-region (region-beginning) (region-end))
            (message "Indented selected region."))
        (progn
          (indent-buffer)
          (message "Indented buffer.")))))

  (global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
```

another way to complete things in Emacs.

```lisp
  (global-set-key (kbd "s-/") 'hippie-expand)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

```

Dired mode and file related operations


**C-x d**
copy, delete and rename file
Copy/Delete/Rname files and folders

+: to create directory 
C-x C-f: to create file
g: to refersh dired buffer
C: copy file
d: delete file
D: delete after confirm
R: rename files

```lisp
  ;; dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t)

  (put 'dired-find-alternate-file 'disabled nil)

  (with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; less typing when Emacs ask you yes or no
  (fset 'yes-or-no-p 'y-or-n-p)
```

open dired of current buffer
```lisp
(require 'dired-x)
```
after applying this setting, we could press `C-x C-j` to jump to the dired buffer of current file.

open finder on Mac. (optional)
Packages:

reveal-in-osx-finder for openning the finder of the current file.

Bonus Time. Use Org-mode literate programming to organize your Emacs configurations.
```lisp
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "zilongshanren.org" user-emacs-directory))
```

# Day 5
Fix smartparen quote issue

```emacs-lisp
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
```

Replace or hidden DOS eolns

```emacs-lisp
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
```

Add more useful packages for web development

web-mode
toggle indent in web-mode
```emacs-lisp
(setq auto-mode-alist
(append
'(("\\.js\\'" . js2-mode)
("\\.html\\'"))
auto-mode-alist)

```

```emacs-lisp
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
```

js2-refactor
https://github.com/js-emacs/js2-refactor.el

```emacs-lisp
(add-hook 'js2-mode-hook #'js2-refactor-mode)
```
```emacs-lisp
(js2r-add-keybindings-with-prefix "C-c C-m")
```

extract method
em is extract-method: Extracts the marked expressions out into a new named method in an object literal.
extract function
ef is extract-function: Extracts the marked expressions out into a new named function.

occur and imenu
improve occur
```emacs-lisp
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
(global-set-key "M-s o" 'occur-dwim)
```

improve imenu

```emacs-lisp
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
        ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
        (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
              (lambda ()
                (setq imenu-create-index-function 'js2-imenu-make-index)))

(global-set-key (kbd "M-s i") 'counsel-imenu)
```

expand-region and iedit mode
https://github.com/magnars/expand-region.el

```emacs-lisp
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
```
https://github.com/victorhge/iedit

Bonus Time. Org export
export to html, you could also export to pdf

```console
C-x C-e
```

## Day 6
### Org-mode
Use org-capture to take notes

```emacs-lisp
(require 'init-org)
(with-eval-after-load 'org
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/.emacs.d"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)))
)

;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)
```

set default encoding system to UTF-8
```emacs-lisp
(set-language-environment "UTF-8")
```
Install Org pomodoro to track my time
clean up configs
move keybindings into one place
make c-n and c-p to select company condicate

## Spacemacs Config
Find the ~/.spacemacs file by pressing SPC f e d

## Creating a Spacemacs Layer
1. Create a new Spacemacs layer.
```bash
M-x configuration-layer/create-layer
```
2. Configuration layer path.
This will then give you the option of where to place the layer, but you can just use the default of **.spacemacs.d/layers/
3. Name of the layer.
4. Creating readme file or not.
