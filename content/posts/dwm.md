---
title: "Getting Started Dynamic Window Manager (DWM)"
date: 2021-11-30T17:50:00+08:00
tags: ["DWM"]
categories: ["WM"]
draft: false
---

## Introduction {#introduction}

dwm is a dynamic window manager for X. It manages windows in **tiled**, **monocle** and **floating** layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.


## Pre-reading {#pre-reading}

1.  [WM/Getting Started Xorg with display manager]({{< relref "Xorg" >}})


## Installing {#installing}

Before you install **DWM**, firstly, please Set-up your **Display Server** and **Display Manager**. I recommand you use X11 (Xorg) as your **Display Server** and Lightdm as your **Display Server**. If you don't know how to do it, please, read [WM/Getting Started Xorg with display manager]({{< relref "Xorg" >}})


### Install DWM {#install-dwm}

There are ways install **DWM**:

1.  Manual patching **DWM** from scratch.
2.  "**Fully fledged**" **DWM**, such as **dwm-flexipatch** (recommand)


#### dwm-flexipatch {#dwm-flexipatch}

If you have ever been **curious** about trying out **dwm**, but have been **discouraged** by manual patching, then this may be a good starting point to see [dwm-flexipatch](https://github.com/bakkeby/dwm-flexipatch.git) Just flip a config and recompile.

Once you have found out what works for you and what doesn't then you should be in a better position to choose patches should you want to start patching from scratch.

Alternatively if you have found the patches you want, but don't want the rest of the flexipatch entanglement on your plate then you may want to have a look at [flexipatch-finalizer](https://github.com/bakkeby/flexipatch-finalizer); a custom pre-processor tool that removes all the unused flexipatch code leaving you with a build that contains the patches you selected.

For how to install flexipatch, please read [DWM Flexipatch]({{< relref "dwmPatches#dwm-flexipatch" >}}).


#### From Scratch {#from-scratch}

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


### Multi Monitor set-up {#multi-monitor-set-up}

Before, you start this section, please read [WM/Multi Monitor SetUp]({{< relref "multiMonitor" >}}) first.
When you done set-up your **~/.xprofile**. You can start read the below **two** sections (**Set Tags** and **Key Binding switch monitor**).


#### Set Tags {#set-tags}

There is a patch [tagicons](https://github.com/bakkeby/patches/wiki/tagicons) that allows you to have different sets of **tags** on a per monitor basis.
As for **dwm-flexipatch** the **tagicons** patch is already integrated (**hardcoded**) so it can't be **enabled** via **patches.h**.

<!--list-separator-->

-  Changing the number of tags per monitor

    In a traditional dwm the number of tags in use can be changed by changing the number of strings in the tags array.

    With this patch the number of tags is controlled with the **NUMTAGS** macro in dwm.c, which is primarily used to differentiate between different icons per monitor.

<!--list-separator-->

-  Tags per monitor

    Tag icons can be defined on a per monitor basis and the position of the icons is derived based on the number of tags (NUMTAGS) and the monitor number (index). If the derived tag index is greater than the available icons then a modulus between the two is further applied.

    Let's have look at a practical example:

    ```c
    static char *tagicons[][NUMTAGS*2] = {
    	[IconsDefault]        = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I" },
    	[IconsVacant]         = { NULL },
    	[IconsOccupied]       = { NULL },
    };
    ```

    In this case icons 1 through 9 is being used for monitor 0 while icons A through I are used for monitor 1.

    **How does that work exactly?**
    Note the **NUMTAGS\*2** which doubles the number of icons. The icon for a tag is derived as tag index + monitor index \* NUMTAGS. So for the third tag on the second monitor we end up with 2 + 1 \* 9 which gives the icon of "C".

    If a third monitor is used then that gives 2 + 2 \* 9 (index 20). As that is greater than the number of icons (NUMTAGS\*2) a modulus is applied: 20 % 18 = 2, giving the icon of "3". In other words the icons wraps around. A fourth monitor would then use icons A through I.

    This mechanism comes into play again in the example below.

<!--list-separator-->

-  Repeating icons

    Having identical tags can also make for an elegant look and feel. For example having all tags shown as bullet points gives a certain aesthetic.

    In a normal dwm build that would be configured like this:

    ```c
    static const char *tags[] = { "•", "•", "•", "•", "•", "•", "•", "•", "•" };
    ```

    With the tagicons patch this can be simplified to a single bullet point thanks to how icon indexes are derived and reduced:

    ```c
    static char *tagicons[][NUMTAGS] = {
    	[IconsDefault]        = { "•" },
    	[IconsVacant]         = { NULL },
    	[IconsOccupied]       = { NULL },
    };
    ```

    Similarly if you choose two tags A and B then tags will alternate between them.

    If you want identical tags for all tags, but different tags per monitor, then you will have to explicitly define them all though.

<!--list-separator-->

-  Occupied tags

    The IconsOccupied tag set will replace the default icons if there are clients occupating the given tag. This is a practical representation of the [alttagsdecoration](https://dwm.suckless.org/patches/alttagsdecoration/) patch.

    If **IconsOccupied** is NULL then that means that the feature is not to be used.

    A practical example:

    ```c
    static char *tagicons[][NUMTAGS] = {
    	[IconsDefault]        = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    	[IconsVacant]         = { NULL },
    	[IconsOccupied]       = { "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>" },
    };
    ```

    When dwm starts up tags 1 through 9 will be displayed. As soon as a client is opened on a tag then the occupied tag icon is being used instead. E.g. opening a client on tag 5 means that "&lt;5&gt;" will be shown instead of "5".

<!--list-separator-->

-  Hide vacant tags

    To hide vacant (as in empty) tags simply set the icon text to be an empty string.

    Taking advantage of the repeating icons logic we can set a single empty string to replicate the behavour of the [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/) patch.

    ```c
    static char *tagicons[][NUMTAGS] = {
    	[IconsDefault]        = { "" },
    	[IconsVacant]         = { NULL },
    	[IconsOccupied]       = { "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>" },
    };
    ```

    One benefit of doing it this way (using empty strings) is that you could choose to hide all tags except for special ones that you want to always display. Here is an example that hides all but the seventh, eight and ninth tag:

    ```c
    static char *tagicons[][NUMTAGS] = {
    	[IconsDefault]        = { "", "", "", "", "", "", "7", "8", "9" },
    	[IconsVacant]         = { NULL },
    	[IconsOccupied]       = { "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>" },
    };
    ```

    If a client exists on tag 3 then "&lt;3&gt;" will be shown as per the occupied tags feature.

    This brings us to an exception; vacant tags.

<!--list-separator-->

-  Vacant tags

    The **IconsVacant** tag set is a bit of an exception and is only used when:

    -   The default icon is hidden (i.e. being an empty string) and
    -   The selected tag is not occupied

    In other words this is only used when you explicitly view a tag that has no clients on it.

    An example configuration may look like:

    ```c
    static char *tagicons[][NUMTAGS] = {
    	[IconsDefault]        = { "" },
    	[IconsVacant]         = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    	[IconsOccupied]       = { "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>" },
    };
    ```

    Here all tags are hidden by default, but show "1", "2", etc. when selected unless they have clients on them.

<!--list-separator-->

-  Alternative tags

    Icon sets are defined by an enum in dwm.c:

    ```c
    enum {
    	IconsDefault,
    	IconsVacant,
    	IconsOccupied,
    	IconsLast
    }; /* icon sets */
    ```

    As with colour schemes you can add your own sets here and as many as you want. Here is an example setup:

    ```c
    static char *tagicons[][NUMTAGS] = {
    	[IconsDefault]        = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    	[IconsBullets]        = { "•" },
    	[IconsLetters]        = { "A", "B", "C", "D", "E", "F", "G", "H", "I" },
    	[IconsText]           = { "mail", "chat", "office", "gimp", "prog", "misc", "play", "mon", "web" },
    	[IconsSubscript]      = { " ₁", " ₂", " ₃", " ₄", " ₅", " ₆", " ₇", " ₈", " ₉"
    	[IconsVacant]         = { "•₁", "•₂", "•₃", "•₄", "•₅", "•₆", "•₇", "•₈", "•₉" },
    	[IconsOccupied]       = { "◉₁", "☢₂", "❖₃", "⚉₄", "♻₅", "⌬₆", "♹₇", "✇₈", "☉₉" },
    };
    ```

    You can then cycle through the various icon sets with the **cycleiconset** function by using the mouse scroll wheel on the tags (provided that the button binding is set of course). Alternatively you can add keybindings to set specific icon sets if you prefer.

    This extends the [alternativetags](https://dwm.suckless.org/patches/alternativetags/) patch by allowing you to have multiple alternative tags rather than just the one.

    It should be noted though that with the implementation as-is the **IconsOccupied icon** set will always override the selected icon set if the tag is occupied by clients. Being able to define occupied and vacant icon sets on a per icon set basis was considered, but was deemed to add too much complexity for a feature that most people would likey not want. One likely solution could be to use variables that point to the sets that defines vacant and occupied icons, and allow these to be changed during runtime.


#### Key Binding switch Monitor {#key-binding-switch-monitor}

The keybindings here are defined as:

```c
 TAGKEYS(                        XK_1,                                  0)
 TAGKEYS(                        XK_2,                                  1)
 TAGKEYS(                        XK_3,                                  2)
 TAGKEYS(                        XK_4,                                  3)
 TAGKEYS(                        XK_5,                                  4)
 TAGKEYS(                        XK_6,                                  5)
 TAGKEYS(                        XK_7,                                  6)
 TAGKEYS(                        XK_8,                                  7)
 TAGKEYS(                        XK_9,                                  8)
```

Which uses the following macro:

```c
#define TAGKEYS(KEY,TAG) \
 	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
 	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
 	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
 	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
```

You can think of the macro as text being copy-pasted for every TAGKEYS reference above.

So MOD+1 will trigger the view function to change the tags on the currently selected monitor.

To focus on another monitor it is expected that you change focus to the other monitor first.

```c
{ MODKEY,                       XK_comma,      focusmon,               {.i = -1 } },
 { MODKEY,                       XK_period,     focusmon,               {.i = +1 } },
```


## Patches {#patches}


### Restart DWM without logging out or closing applications {#restart-dwm-without-logging-out-or-closing-applications}

dwm can now be restarted without destroying other X windows by pressing the usual Mod-Shift-Q combination.
	{ MODKEY|ShiftMask,             XK_r,          self_restart,           {0} },
	#endif // SELFRESTART_PATCH


### dwm-fullgaps {#dwm-fullgaps}


### Autostart {#autostart}

_\* This patch will make dwm run "~_.local/share/dwm/autostart_blocking.sh" and

-   "~/.local/share/dwm/autostart.sh &amp;" before entering the handler loop. One or
-   both of these files can be ommited. Note the path inside .local/share rather
-   than the original ~/.dwm folder.
-   <https://dwm.suckless.org/patches/autostart/>
    \*/

\#define AUTOSTART_PATCH 1

cd _home/yanboyang713_.local/share/dwm

autostart_blocking.sh

```sh
#!/bin/sh

if [ -n "$(qvm-usb | grep tslil_clingman_dactyl_manuform_mini_0)" ]; then
	# If my USB keyboard is detected, don't mangle the layout
	setxkbmap -layout us -variant altgr-intl -option caps:ctrl_modifier,terminate:ctrl_alt_bksp,nodeadkeys
else
	# Otherwise set the layout for the built-in keyboard
	setxkbmap -model pc104curl-z -layout us -variant cmk_ed_dh -option caps:ctrl_modifier,terminate:ctrl_alt_bksp
fi
# In a better world we could use something like
# internal_keyboard=$(xinput -list | grep 'AT Translated' | sed 's/^.*id=\([0-9]*\).*$/\1/')
# setxkbmap -device $internal_keyboard ...
# but Qubes only sends one input source to each domU so this wont work.

# I used to have a slightly-too-large Coreboot image in the EEPROM and it
# would occassionaly cause the RAM to fail. This is fixed, but i might as
# well keep the following around.
if [ "$(xl info | awk '/total_memory/ { print $3 }')" -lt "16148" ]; then
	notify-send -u critical "RAM malfunction"
fi;

# FHD mod! Thanks nitrocaster for your hard work, and the coreboot community
# for the patch that disconnects the internal LVDS.
if [ -n "$(xrandr | grep 'VGA1 connected')" ]; then
	xrandr --output eDP --auto --output VGA1 --left-of eDP --auto
fi

exec xdg_autostart
```

autostart.sh

```sh
#!/bin/sh

# This is to catch lock-session from systemd
xss-lock lock &

# No dpms
xset -dpms

# The idle timer is handled elsewhere
echo "enable autolock" > ~/.autolock_status
toggle_autolock

# Set my wallpaper
feh --bg-scale /usr/share/backgrounds/tiles/default_blue.jpg

exec dwm_status &
```


### Fullscreen {#fullscreen}

This patch allows you to toggle fullscreen on and off using a single shortcut key.

```c
#define TOGGLEFULLSCREEN_PATCH 1
```

```console
[yanboyang713@manjaro] ➜ dwm-flexipatch (U master) rm config.h
rm: remove write-protected regular file 'config.h'? yes
```

```c
	{ MODKEY,                       XK_y,          togglefullscreen,       {0} },
```


## Reference List {#reference-list}

1.  <https://github.com/bakkeby/dwm-flexipatch/issues/213>
2.  <https://github.com/bakkeby/patches/wiki/tagicons>


## Acknowledge {#acknowledge}

1.  Stein Gunnar Bakkeby: <https://github.com/bakkeby>
