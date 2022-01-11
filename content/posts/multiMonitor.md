---
title: "Multi Monitor SetUp"
date: 2022-01-11T13:59:00+08:00
tags: ["multi", "monitor"]
categories: ["WM"]
draft: false
---

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
