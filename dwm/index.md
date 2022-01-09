# Getting Started Dynamic Window Manager (DWM)


## Introduction {#introduction}

dwm is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.


## Installing {#installing}


### Install Xorg {#install-xorg}

```bash
pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
```


### Install DWM {#install-dwm}

```bash
git clone git://git.suckless.org/dwm ~/.config/dwm
git clone https://github.com/WouterSpekkink/dwm.git




git clone git://git.suckless.org/st ~/.config/st
git clone https://github.com/WouterSpekkink/st.git



git clone git://git.suckless.org/dmenu ~/.config/dmenu
git clone https://github.com/WouterSpekkink/dmenu.git
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


## DWM patches {#dwm-patches}

There are two types of patches: The ones that fit to your personal taste and the ones you think should be included in mainline.

patch filename format
The expected format for patches is:

For git revisions:

toolname-patchname-YYYYMMDD-SHORTHASH.diff
dwm-allyourbase-20160617-3465bed.diff
The YYYYMMDD date should correspond to the last time the patch has been modified.


### diff generation {#diff-generation}

For git users:

cd program-directory
git add filechanges...
git commit (write a clear patch description)
git format-patch --stdout HEAD^ &gt; toolname-patchname-YYYYMMDD-SHORTHASH.diff


### patch program {#patch-program}

For git users, use -3 to fix the conflict easily:

cd program-directory
git apply path/to/patch.diff
For patches formatted with git format-patch:

cd program-directory
git am path/to/patch.diff
For tarballs:

cd program-directory
patch -p1 &lt; path/to/patch.diff


## picom {#picom}

picom is a standalone compositor for Xorg, suitable for use with window managers that do not provide compositing. picom is a fork of compton, which is a fork of xcompmgr-dana, which in turn is a fork of xcompmgr.

```bash
yay -S picom
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


## Status Monotor {#status-monotor}

pre-required

```bash
yay -S pamixer
```

<https://github.com/LukeSmithxyz/dwmblocks>

```bash
xsetroot -name "Boyang Yan"
xsetroot -name "$(uptime)"
```

**NOTE**: If show **zsh: command not found: xsetroot**, you need install **xorg-xsetroot**.

```bash
sudo pacman -S xorg-xsetroot
```

```bash
git clone https://github.com/WouterSpekkink/dwmblocks.git
cd dwmblocks

sudo make clean install
dwmblocks &
```

**NOTE**:

1.  If you faced **ERROR** message like this **sh: line 1: sb-internet: command not found**
    you should check your default paths in file: profile and your **sb-\*** program.
2.  If there are some **ERROR** show out. You need kill dwmblocks and run again.

<!--listend-->

```bash
ps aux | grep dwmblocks
kill -9 6416
```

<https://dwm.suckless.org/status_monitor/>

```bash
git clone git://git.suckless.org/dwmstatus
cd dwmstatus
make
sudo make PREFIX=/usr install
```

add

```text
dwmstatus 2>&1 >/dev/null &
```

to your .xinitrc


## slock {#slock}

Simple X display locker. This is the simplest X screen locker we are aware of.

```bash
git clone https://git.suckless.org/slock
cd slock
```

Before, your **sudo make install**
You need

```bash
vim config.def.h
```

change to

```text
/* user and group to drop privileges to */
static const char *user  = "yanboyang713";
static const char *group = "yanboyang713";
```

slock: getgrnam nogroup: group entry not found

Test, it is working.

```console
[yanboyang713@manjaro] ➜ system whereis slock
slock: /usr/local/bin/slock
```

/etc/systemd/system/slock@.service

```text
[Unit]
Description=Lock X session using slock for user %i
Before=sleep.target

[Service]
User=%i
Environment=DISPLAY=:0
ExecStartPre=/usr/bin/xset dpms force suspend
ExecStart=/usr/bin/slock

[Install]
WantedBy=sleep.target
```

systemctl daemon-reload

sudo systemctl enable slock@yanboyang713.service


## Basic Commands {#basic-commands}

-   Moving between windows: **[Alt]+[j]** or **[Alt]+[k]**
-   To move a terminal to another tag: **[Shift]+[Alt]+[&lt;TAG_NUMBER&gt;]**
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

