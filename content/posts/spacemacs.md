---
title: "Getting Started with Spacemacs"
date: 2021-04-04T06:11:32+10:00
tags: [ "spacemacs", "emacs" ]
categories: [ "emacs" ]
---
## installation

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


