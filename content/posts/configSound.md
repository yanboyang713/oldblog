---
title: "Arch Linux/Manjaro sound and sound card configuration"
date: 2021-12-20T19:04:00+08:00
tags: ["arch", "linux", "manjaro", "sound", "card"]
categories: ["Linux"]
draft: false
---

## Introduction {#introduction}

After install Arch Linux/Manjaro, although alsa-utils has been installed, it may still not play sound correctly. Here is a solution.


## First try {#first-try}

```bash
amixer sset Master unmute
```

If you use alsamixer to unmute the master sound, you still can't play the sound.

Please, following the steps at the below.

**NOTE**: If you faced maixer: Unable to find simple cintrol 'Master', 0, that means, it maybe that the sound card device cannot be found or the sound card driver us not installed.


## Finding sound card ID and set-up .asoundrc file {#finding-sound-card-id-and-set-up-dot-asoundrc-file}

Using below commands to get the sound card ID and device ID of the sound card you want to use.

```bash
aplay -l
```

There is a example for select the sound card with the sound card ID of 1 and the device ID of 0 for configuration.

Add the following three lines to the configuration file ~/.asoundrc

```text
defaults.pcm.card 1
defaults.pcm.device 0
defaults.ctl.card 1
```

The **PCM** option determines the device used to play audio, and the **CTL** option determines which sound card can be used by the control tool (alsamixer)

If you want to manage configuration files in a unified way, please have a read [Linux/Managing Your Dotfiles With Git and Make]({{< relref "dotfiles" >}}).
