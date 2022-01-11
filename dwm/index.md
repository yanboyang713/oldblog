# Getting Started Dynamic Window Manager (DWM)


## Introduction {#introduction}

dwm is a dynamic window manager for X. It manages windows in **tiled**, **monocle** and **floating** layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.


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


## Default Usage {#default-usage}

In this section, I will introduction the basic usage by default. After, I will talk more on how to make you **OWN** configuration and Patches.


### Basic Commands {#basic-commands}

-   Moving between windows: **[Alt]+[j]** or **[Alt]+[k]**
-   To move a terminal to another tag: **[Shift]+[Alt]+[&lt;TAG_NUMBER&gt;]**
-   To focus on another tag: **[Alt]+[tag number]**
-   To change the amount of windows in the master area: **[Alt]+[d]** (Decrease) or **[Alt]+[i]** (Increase)
-   To toggle a window between the master and stack area: **[Alt]+[Return]**
-   To kill a window: **[Shift]+[Alt]+[c]**
-   Click another tag with the right mouse button to bring those windows into your current focus.


### Layouts {#layouts}

**Note**: By default dwm is in tiled layout mode.

-   Tiled: **[Alt]+[t]**
-   Floating: **[Alt]+[f]**
-   Monocle: **[Alt]+[m]**

Further layout modes can be included through patches.


### Floating {#floating}

To resize the floating window: **[Alt]+[right mouse button]**

To move it around **[Alt]+[left mouse button]**

Floating in Tiled Layout

-   Toggle floating mode on the active window: **[Alt]+[Shift]+[space]**
-   Resize the window: **[Alt]+[right mouse button]**
-   toggle it in being floating **[Alt]+[middle mouse button]**

If you want to set some type of window to be always floating, look at the config.def.h and the rules array, where the last but one element defines this behaviour.


### Quitting {#quitting}

To quit dwm cleanly: **[Shift]+[Alt]+[q]**


## Configuration {#configuration}

All of configuration should be in **config.def.h** file.

When you make modified, please run:

```bash
rm config.h
sudo make clean install
```


### Change Mod1 key to the Windows key {#change-mod1-key-to-the-windows-key}

**dwm**'s documentation refers to **Mod1** as the **modifier** key that you must press to issue commands to it.

On most keyboards, **Mod1** is mapped to the **left Alt** key. Most new keyboards now come equipped with the **Windows** key. Since no known UNIX/X applications are known to use the **Windows** key, it is an excellent alternative mapping to issue commands to dwm.

In **config.def.h**, under the comment ,/\* key definitions \*/, you can find the line

```text
#define MODKEY Mod1Mask
```

In order to change dwm's modifier key to the **Windows** key, you can simply change its value definition to **Mod4Mask**.

```text
//Change ALT key to Windows key
#define MODKEY Mod4Mask
```


#### Other modifier key {#other-modifier-key}

There are 5 modifiers, Mod1Mask to Mod5Mask. They are associated to up-to three keysyms (keycodes) from the X window server. To show the current association on your keyboard, run xmodmap with no arguments. It will show something like:

```console
[yanboyang713@manjaro] ➜ ~ xmodmap
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_L (0x32),  Shift_R (0x3e)
lock
control     Control_L (0x25),  Control_R (0x69)
mod1        Alt_L (0x40),  Alt_R (0x6c),  Meta_L (0xcd)
mod2        Num_Lock (0x4d)
mod3
mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)
```

Using **xev**, a utility to show X events, such as key presses, we can quickly identify which keysym (keycode) combination a particular key has, and associate that to a modifier using **xmodmap**.


### Change terminal as Alacritty {#change-terminal-as-alacritty}

If you **NOT** install Alacritty, please have look this [Linux/Getting Started Alacritty Terminal]({{< relref "alacritty" >}}).

When you done install **Alacritty**,

Change termcmd as below.

```text
static const char *termcmd[]  = { "alacritty", NULL };
```

and add below to keys array (static Key keys[])

```text
{ MODKEY,             XK_Return,     spawn,                  {.v = termcmd } },
```


### Add Hotkey for some of binary program {#add-hotkey-for-some-of-binary-program}

There are **two** example, **emacs**, **zotero** and **google-chrome-stable**.

Please, set-up **emacs** and **zotero** first. Following the below guide:

1.  [Emacs/Getting Started with Doom Emacs]({{< relref "doom" >}})
2.  [Research/Getting Started with Zotero]({{< relref "zotero" >}})

Firstly, create two new variable for each command.

```text
static const char *emacscmd[] = { "emacsclient", "-c", "-a emacs", NULL };
static const char *zoterocmd[] = { "zotero", NULL };
static const char *googleChromecmd[] = { "google-chrome-stable", NULL };
```

and add below to keys array (static Key keys[])

```text
	{ MODKEY,                       XK_e, 	   spawn,          {.v = emacscmd } },
	{ MODKEY,                       XK_z,      spawn,          {.v = zoterocmd } },
	{ MODKEY,                       XK_g,      spawn,          {.v = googleChromecmd } },
```


### Add Hotkey for shell commands {#add-hotkey-for-shell-commands}

There is a example for take a screenshot.
First, please read [Linux/Take a Screenshot and upload to Cloudinary using Bash Scripts]({{< relref "cloudinary" >}}).

```text
/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
```

```text
{ ControlMask|ShiftMask,              XK_p,      spawn,          SHCMD("screenshot") },
```


## Patches {#patches}

