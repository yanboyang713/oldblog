# Getting Started Display Server compared with X11, Wayland and Mir


## Introduction {#introduction}

In Linux related articles, news and discussions, you’ll often come across the term display server, Xorg, Wayland etc.


## What is display server in Linux? {#what-is-display-server-in-linux}

A **display server** is a program which is responsible for the input and output coordination of its clients, to and from the rest of the operating system, and among the **hardware** and the **operating system**.

Basically, thanks to a display server, you can use your computer **graphically** (GUI). Without the display server, you would only be restricted to a **command line** interface ([TTY](https://itsfoss.com/what-is-tty-in-linux/)).

The display server provides the framework for a **graphical** environment so that you can use **mouse** and **keyboard** to interact with applications.

The display server communicates with its clients over the [display server protocol](https://en.wikipedia.org/wiki/X_Window_System_core_protocol), like **X11**. The display server is a key component in any **graphical** user interface, specifically the **windowing** system.

Don’t confuse display server with [desktop environment](https://itsfoss.com/what-is-desktop-environment/). The desktop environment uses display server **underneath** it.

Sounds familiar but it is not fully clear? Let me explain.


## Display server communications protocols in Linux {#display-server-communications-protocols-in-linux}

There are three display protocols available in Linux, the X11, Wayland and Mir. I’ll give you a brief introduction for these display servers.


### X11 {#x11}

The X11 (also refer as X) is the **legacy** display server that has been existed for years. It is the most common display server used in Linux distributions.

{{< figure src="http://res.cloudinary.com/dkvj6mo4c/image/upload/v1642051726/screenshot/q6x84k4stonsani6dmqz.png" >}}

The X11 communication protocol, uses the [X.org Server](https://en.wikipedia.org/wiki/X.Org_Server) display server. It receives input events from [device drivers](https://en.wikipedia.org/wiki/Device_driver) and makes them available to one of its clients.

The display server also receives data from its clients, it processes the data and does the compositing and on Linux it passes the data to one of three kernel components:

1.  [DRM](https://en.wikipedia.org/wiki/Direct_Rendering_Manager)
2.  [gem](https://en.wikipedia.org/wiki/Graphics_Execution_Manager)
3.  [KMS driver](https://en.wikipedia.org/wiki/KMS_driver)

The X.Org Server is a display server that relies on a second program, the [compositing window manager](https://en.wikipedia.org/wiki/Compositing_window_manager), to do the compositing. Examples are [Mutter](https://en.wikipedia.org/wiki/Mutter_(window_manager)) or [KWin](https://en.wikipedia.org/wiki/KWin). **GNOME** uses Mutter.


### Wayland {#wayland}

As per its website, Wayland is “intended as a simpler replacement for X, easier to develop and maintain”.

And indeed [Wayland](https://wayland.freedesktop.org/) is the modern display server that is supposed to replace the legacy X display server.

Its adoption is still a work in progress. Ubuntu tried to switch to Wayland as the default display server with version 17.10 but the experiment met with negative feedback.

A lot of GUI applications and their frameworks **depend** on the X server. These applications **didn’t** work as intended on Wayland.

This forced Ubuntu to stay on X as default display server. It still provides the option to use **Wayland** but it is not default anymore.

An overwhelming majority of distributions use X display server by default even today.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1642052710/screenshot/icvjiwrjzehjfw7zd4fp.png" >}}

Display servers that put into effect the Wayland display server protocol, are called Wayland compositors. Like any X11, a Wayland compositor is responsible for handling input and output for its clients but also does the compositing – in contrast to X11.

A few Wayland compositors are [Weston](https://en.wikipedia.org/wiki/Weston_(software)), [Mutter](https://en.wikipedia.org/wiki/Mutter_(software)), [KWin](https://en.wikipedia.org/wiki/KWin) or [Enlightenment](https://en.wikipedia.org/wiki/Enlightenment_(software)).


### Mir {#mir}

The [Mir display server](https://mir-server.io/) comes with its own Mir display server protocol which differs to those used by X11 and Wayland. It was developed by [Canonical](https://canonical.com/), as part of the development of Unity, and was intended to be the display server of choice for [Ubuntu](https://itsfoss.com/install-ubuntu/).

As of 2017, it has been replaced with the Wayland display server for desktop editions of Ubuntu, although Mir’s development continued for Internet of Things (IoT) applications.


## Why are we still using Xorg? {#why-are-we-still-using-xorg}

Wayland as it is relatively new, is not very stable yet, compared to Xorg. The programs, which act as clients, in order to communicate with a display server, must know how to do it.

For this reason, many programs might not run when using Wayland. Ubuntu’s experiment to switch to Wayland by default confirmed this.


## Post-reading {#post-reading}

1.  [WM/Getting Started Xorg]({{< relref "Xorg" >}})


## Refernce List {#refernce-list}

1.  <https://itsfoss.com/display-server/>

