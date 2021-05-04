---
title: "Install Chinese Input Method in Linux"
date: 2020-02-05T06:11:32+10:00
tags: [ "chinese input method" ]
categories: [ "Linux" ]
---
## Install fcite packages in Manjaro

```bash
yay -Syu adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts
```

```bash
yay -Syu fcitx fcitx-googlepinyin fcitx-im fcitx-configtool
```

## Config Environmental variables

```bash
vim ~/.profile
```

add:

```file
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &
```

```bash
source .profile
```


