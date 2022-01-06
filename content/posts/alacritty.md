---
title: "Getting Started Alacritty Terminal"
date: 2022-01-05T18:37:00+08:00
categories: ["Linux"]
draft: false
---

## Introduction {#introduction}

[Alacritty](https://github.com/alacritty/alacritty) is a modern terminal emulator that comes with sensible defaults, but allows for extensive configuration. By integrating with other applications, rather than reimplementing their functionality, it manages to provide a flexible set of features with high performance. The supported platforms currently consist of BSD, Linux, macOS and Windows.


## Installation {#installation}


### NIX {#nix}

You can use **NIX** install **Alacritty**. [Nix/Getting Started with Nix]({{< relref "nix" >}})


### Arch Linux {#arch-linux}

```bash
yay -S mesa-git alacritty-git
```


## Set as default terminal {#set-as-default-terminal}


### Ubuntu {#ubuntu}

it is necessary to define it as an alternative available for ‘terminal’ type applications:

```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
```

(The number ‘50’ at the end represents the priority of the entry)

It will then be possible to define it as the default terminal, thanks to the command:

```bash
sudo update-alternatives --config x-terminal-emulator
```

Finally, if you want to remove alacritty from the available alternatives:

```bash
sudo update-alternatives --remove "x-terminal-emulator" "/usr/bin/alacritty"
```


### I3 WM {#i3-wm}

```text
bindsym $mod+Return exec alacritty
```


## Reference List {#reference-list}

1.  <https://betterprogramming.pub/a-minimal-and-configurable-terminal-setup-72aa833672e>
2.  <https://frantzroulet.com/blog/other/2018/12/26/how-to-choose-alacritty-as-default-terminal.html>
