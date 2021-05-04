# Install Chinese Input Method in Linux

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



