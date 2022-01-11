# Getting Started Slock


## Introduction {#introduction}


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


## Reference List {#reference-list}

1.  <https://github.com/bakkeby/slock-flexipatch>

