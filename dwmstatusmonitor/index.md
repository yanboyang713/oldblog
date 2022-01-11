# Getting Started DWM's Status Monitor


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

