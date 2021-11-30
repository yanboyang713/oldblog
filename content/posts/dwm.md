---
title: "Getting Started Dynamic Window Manager (DWM)"
date: 2021-11-30T17:50:00+08:00
categories: ["Linux"]
draft: false
---

## Introduction {#introduction}


## Installing {#installing}


### Install Xorg {#install-xorg}

```console
pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
```


### Install DWM {#install-dwm}

```bash
git clone git://git.suckless.org/dwm ~/.config/dwm
git clone git://git.suckless.org/st ~/.config/st
git clone git://git.suckless.org/dmenu ~/.config/dmenu
```

```bash
cd ~/.config/dwm && sudo make install
cd ~/.config/st && sudo make install
cd ~/.config/dmenu && sudo make install
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


### Adding an entry for DWM in the DM {#adding-an-entry-for-dwm-in-the-dm}

Create this file and add the following.

```bash
mkdir /usr/share/xsessions

sudo vim /usr/share/xsessions/dwm.desktop
```

```file
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=the dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
```


## Multi-monitor setup {#multi-monitor-setup}

If configured to use Xinerama libraries in config.mk, dwm can automatically detect configured screen outputs (monitor, overhead projector, etc.) and their resolutions and draw the windows in the output area accordingly.

One of the easiest ways to configure screen outputs is via the RandR X server extension using the xrandr tool. Without arguments it will list the current configuration of screen outputs.

```bash
xrandr
```

For each connected output the supported resolution modes will be printed.

This is a example for set-up xrandr. You can put below content into ~/.xprofile, when system run X windows will set-up montors automatically.

```bash
#!/bin/bash

###############################
# Set Monitor                 #
###############################
xrandr --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-1 --mode 2560x1440 --pos 1080x0 --rotate normal --output DVI-D-1 --off
```


## Basic Commands {#basic-commands}

-   Moving between windows: **[Alt]+[j]** or **[Alt]+[k]**
-   To move a terminal to another tag: **[Shift]+[Alt]+[<TAG\_NUMBER>]**
-   To focus on another tag: **[Alt]+[tag number]**
-   To change the amount of windows in the master area: **[Alt]+[d]** (Decrease) or **[Alt]+[i]** (Increase)
-   To toggle a window between the master and stack area: **[Alt]+[Return]**
-   To kill a window: **[Shift]+[Alt]+[c]**
-   Click another tag with the right mouse button to bring those windows into your current focus.


## Layouts {#layouts}

**Note**: By default dwm is in tiled layout mode.

-   Tiled: **[Alt]+[t]**
-   Floating: **[Alt]+[f]**
-   Monocle: **[Alt]+[m]**

Further layout modes can be included through patches.


## Floating {#floating}

To resize the floating window: **[Alt]+[right mouse button]**

To move it around **[Alt]+[left mouse button]**

Floating in Tiled Layout

-   Toggle floating mode on the active window: **[Alt]+[Shift]+[space]**
-   Resize the window: **[Alt]+[right mouse button]**
-   toggle it in being floating **[Alt]+[middle mouse button]**

If you want to set some type of window to be always floating, look at the config.def.h and the rules array, where the last but one element defines this behaviour.


## Quitting {#quitting}

To quit dwm cleanly: **[Shift]+[Alt]+[q]**
