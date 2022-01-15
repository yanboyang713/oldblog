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


## xinit {#xinit}

The xinit program allows a user to manually start an Xorg display server. The startx script is a front-end for xinit.

xinit is typically used to start [window managers](https://wiki.archlinux.org/title/Window_manager) or [desktop environments](https://wiki.archlinux.org/title/Desktop_environment). While you can also use xinit to run GUI applications without a window manager, many graphical applications expect an EWMH compliant window manager. Display managers start Xorg for you and generally source xprofile.


### Configuration {#configuration}

xinit and startx take an optional client program argument, see #Override xinitrc. If you do not provide one they will look for ~/.xinitrc to run as a shell script to start up client programs.


#### xinitrc {#xinitrc}

**~/.xinitrc** is handy to run programs depending on X and set environment variables on X server startup. If it is present in a user's home directory, startx and xinit execute it. Otherwise startx will run the default **/etc/X11/xinit/xinitrc**.

This default xinitrc will start a basic environment with Twm, xorg-xclock and Xterm (assuming that the necessary packages are installed). Therefore, to start a different window manager or desktop environment, first create a copy of the default xinitrc in your home directory:

```bash
cp /etc/X11/xinit/xinitrc ~/.xinitrc
```

Then edit the file and replace the default programs with desired commands. Remember that lines following a command using exec would be ignored. For example, to start xscreensaver in the background and then start openbox, use the following:

**~/.xinitrc**

```text
xscreensaver &
exec openbox-session
```

**Note**: At the very least, ensure that the last **if** block in **/etc/X11/xinit/xinitrc** is present in your **~/.xinitrc** file to ensure that the scripts in **/etc/X11/xinit/xinitrc.d** are sourced.

Long-running programs started before the window manager, such as a screensaver and wallpaper application, must either fork themselves or be run in the background by appending an &amp; sign. Otherwise, the script would halt and wait for each program to exit before executing the window manager or desktop environment. Note that some programs should instead not be forked, to avoid race bugs, as is the case of xrdb. Prepending exec will replace the script process with the window manager process, so that X does not exit even if this process forks to the background.


#### xserverrc {#xserverrc}

The xserverrc file is a shell script responsible for starting up the X server. Both **startx** and **xinit** execute **~/.xserverrc** if it exists, **startx** will use **/etc/X11/xinit/xserverrc** otherwise.

In order to maintain an [authenticated session](https://wiki.archlinux.org/title/General_troubleshooting#Session_permissions) with **logind** and to prevent bypassing the screen locker by switching terminals, Xorg has to be started on the same virtual terminal where the login occurred. Therefore it is recommended to specify **vt$XDG_VTNR** in the **~/.xserverrc** file:

~/.xserverrc

```bash
#!/bin/sh

exec /usr/bin/Xorg -nolisten tcp "$@" vt$XDG_VTNR
```

See [Xserver](https://man.archlinux.org/man/Xserver.1) for a list of all command line options.

**Tip**: **-nolisten local** can be added after **-nolisten tcp** to disable abstract sockets of X11 to help with isolation. There is a quick background on how this potentially affects X11 security.

Alternatively, if you wish to have the X display on a separate console from the one where the server is invoked, you can do so by using the X server wrapper provided by **/usr/lib/systemd/systemd-multi-seat-x**. For convenience, xinit and startx can be set up to use this wrapper by modifying your **~/.xserverrc**.

**Note**: To re-enable redirection of the output from X session into the Xorg log file, add the -keeptty option. See [Xorg#Session log](https://wiki.archlinux.org/title/Xorg#Session_log_redirection) redirection for details.


### Usage {#usage}

To run Xorg as a regular user, issue:

```bash
$ startx
```

Or if #xserverrc is configured:

```bash
$ xinit -- :1
```

**Note**: xinit does not handle multiple displays when another X server is already started. For that you must specify the display by appending **-- :display_number**, where **display_number** is **1** or more.

Your window manager (or desktop environment) of choice should now start correctly.

To quit X, run your window manager's exit function (assuming it has one). If it lacks such functionality, run:

```bash
$ pkill -15 Xorg
```

**Note**: pkill will kill all running X instances. To specifically kill the window manager on the current virtual terminal, run:

```bash
$ pkill -15 -t tty"$XDG_VTNR" Xorg
```

See also [signal(7)](https://man.archlinux.org/man/signal.7).


### Tips and tricks {#tips-and-tricks}


#### Override xinitrc {#override-xinitrc}

If you have a working **~/.xinitrc** but just want to try other window manager or desktop environment, you can run it by issuing startx followed by the path to the window manager, for example:

```bash
$ startx /usr/bin/i3
```

If the binary takes arguments, they need to be quoted to be recognized as part of the first parameter of startx:

```bash
$ startx "/usr/bin/application --key value"
```

**Note** that the full path is **required**. You can also specify custom options for the #xserverrc script by appending them after the double dash -- sign:

```bash
$ startx /usr/bin/enlightenment -- -br +bs -dpi 96
```

See also [startx(1)](https://man.archlinux.org/man/startx.1).

**Note**: Display needs to be specified (as loading _etc/X11/xinit/xinitrc.d_ is skipped) for some operations to work (e.g. notification daemons).

**Tip**: This can be used to start regular GUI programs but without any of the basic window manager features. See also [#Starting applications without a window manager](https://wiki.archlinux.org/title/Xinit#Starting_applications_without_a_window_manager) and [Running program in separate X display](https://wiki.archlinux.org/title/Running_program_in_separate_X_display).


#### Autostart X at login {#autostart-x-at-login}

Make sure that startx is properly configured.

Place the following in your [login shell](https://wiki.archlinux.org/title/Login_shell) initialization file (e.g. **~/.bash_profile** for Bash or **~/.zprofile** for Zsh):

```bash
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

You can replace the **-eq** comparison with one like **-le 3** (for vt1 to vt3) if you want to use graphical logins on more than one virtual terminal.

Alternative conditions to detect the virtual terminal include **"$(tty)" = "/dev/tty1"**, which does not allow comparison with **-le**, and **"$(fgconsole 2&gt;/dev/null || echo -1)" -eq 1**, which does not work in [serial consoles](https://wiki.archlinux.org/title/Serial_console).

If you would like to remain logged in when the X session ends, remove **exec**.

**Warning**: Without **exec**, anyone that can kill X can get a shell and access to files in your home directory. Decide whether this matters to you before implementing the above.

See also [Fish#Start X at login](https://wiki.archlinux.org/title/Fish#Start_X_at_login) and [Systemd/User#Automatic login into Xorg without display manager](https://wiki.archlinux.org/title/Systemd/User#Automatic_login_into_Xorg_without_display_manager).

**Tip**: This method can be combined with [automatic login to virtual console](https://wiki.archlinux.org/title/Automatic_login_to_virtual_console).


#### Switching between desktop environments/window managers {#switching-between-desktop-environments-window-managers}

If you are frequently switching between different desktop environments or window managers, it is convenient to either use a display manager or expand **~/.xinitrc** to make the switching possible.

The following example shows how to start a particular desktop environment or window manager with an argument:

**~/.xinitrc**

```text
...

# Here Xfce is kept as default
session=${1:-xfce}

case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
```

To pass the argument session:

```bash
$ xinit session
```

or

```bash
$ startx ~/.xinitrc session
```


#### Starting applications without a window manager {#starting-applications-without-a-window-manager}

It is possible to start only specific applications without a window manager, although most likely this is only useful with a single application shown in full-screen mode. For example:

~/.xinitrc

```bash

...

exec chromium
```

Alternatively the binary can be called directly from the command prompt as described in []#Override xinitrc](https://wiki.archlinux.org/title/Xinit#Override_xinitrc).

With this method you need to set each application's window geometry through its own configuration files (if possible at all).

**Tip**: This can be useful to launch graphical games, where excluding the overhead of a compositor can help improve the game's performance.

See also [Display manager#Starting applications without a window manager](https://wiki.archlinux.org/title/Display_manager#Starting_applications_without_a_window_manager).


## xprofile {#xprofile}

An xprofile file, ~/.xprofile and /etc/xprofile, allows you to execute commands at the beginning of the X user session - before the window manager is started.

The xprofile file is similar in style to xinitrc.


### Compatibility {#compatibility}

The xprofile files are natively sourced by the following display managers:

-   GDM - /etc/gdm/Xsession
-   LightDM - /etc/lightdm/Xsession
-   LXDM - /etc/lxdm/Xsession
-   SDDM - /usr/share/sddm/scripts/Xsession

Sourcing xprofile from a session started with xinit

It is possible to source xprofile from a session started with one of the following programs:

-   startx
-   xinit
-   XDM
-   Any other Display manager which uses ~/.xsession or ~/.xinitrc

All of these execute, directly or indirectly, ~/.xinitrc or /etc/X11/xinit/xinitrc if it does not exist. That is why xprofile has to be sourced from these files.

~/.xinitrc and /etc/X11/xinit/xinitrc

```sh
#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

...
```


### Configuration {#configuration}

Firstly, create the file ~/.xprofile if it does not exist already. Then, simply add the commands for the programs you wish to start with the session. See below:

~/.xprofile

```text
tint2 &
nm-applet &
```


## Reference List {#reference-list}

1.  <https://wiki.archlinux.org/title/Xinit>
2.  <https://wiki.archlinux.org/title/LightDM>
3.  <https://wiki.archlinux.org/title/Display_manager>
4.  <https://wiki.archlinux.org/title/Xprofile>
