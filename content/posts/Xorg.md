---
title: "Getting Started Xorg with display manager"
date: 2022-01-13T14:00:00+08:00
tags: ["Xorg"]
categories: ["WM"]
draft: false
---

## Introduction {#introduction}


## Pre-reading {#pre-reading}

1.  [WM/Getting Started Display Server compared with X11, Wayland and Mir]({{< relref "displayServer" >}})


### Install Xorg {#install-xorg}

```bash
pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
```


### Installing a Display Manager (DM) {#installing-a-display-manager--dm}

```bash
pacman -S lightdm

pacman -S lightdm-gtk-greeter

pacman -S lightdm-gtk-greeter-settings
```


### Enable lightdm service {#enable-lightdm-service}

```bash
sudo systemctl enable lightdm
```


## Reference List {#reference-list}

1.  <https://wiki.archlinux.org/title/Xinit>
2.  <https://wiki.archlinux.org/title/LightDM>
3.  <https://wiki.archlinux.org/title/Display_manager>
