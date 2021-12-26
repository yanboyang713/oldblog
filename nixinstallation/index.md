# Nix Installation


## Supported Platforms {#supported-platforms}

Nix is currently supported on the following platforms:

-   Linux (i686, x86\_64, aarch64).
-   macOS (x86\_64).


## Installing a Binary Distribution {#installing-a-binary-distribution}

We recommend the multi-user install if it supports your platform and you can authenticate with sudo.


## Single User Installation {#single-user-installation}

To explicitly select a single-user installation on your system:

```bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

This will perform a single-user installation of Nix, meaning that **/nix** is owned by the invoking user. You should run this under your usual user account, not as root. The script will invoke **sudo** to create **/nix** if it doesn’t already exist. If you don’t have **sudo**, you should manually create **/nix** first as root, e.g.:

```bash
mkdir /nix
chown alice /nix
```

The install script will modify the first writable file from amongst **.bash\_profile**, **.bash\_login** and **.profile** to source **~/.nix-profile/etc/profile.d/nix.sh**. You can set the **NIX\_INSTALLER\_NO\_MODIFY\_PROFILE** environment variable before executing the install script to disable this behaviour.

You can uninstall Nix simply by running:

```bash
rm -rf /nix
```


## Multi User Installation (recommend) {#multi-user-installation--recommend}

The multi-user Nix installation creates system users, and a system service for the Nix daemon.

**Supported Systems**

-   Linux running systemd, with SELinux disabled
-   macOS

You can instruct the installer to perform a multi-user installation on your system:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

The multi-user installation of Nix will create build users between the user IDs 30001 and 30032, and a group with the group ID 30000. You should run this under your usual user account, not as root. The script will invoke sudo as needed.

When you see:

**Alright! We're done!**
Try it! Open a new terminal, and type:

```bash
nix-shell -p nix-info --run "nix-info -m"
```

The installer will modify /etc/bashrc, and /etc/zshrc if they exist. The installer will first back up these files with a .backup-before-nix extension. The installer will also create /etc/profile.d/nix.sh.

You can uninstall Nix with the following commands:

```bash
sudo rm -rf /etc/profile/nix.sh /etc/nix /nix ~root/.nix-profile ~root/.nix-defexpr ~root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels

# If you are on Linux with systemd, you will need to run:
sudo systemctl stop nix-daemon.socket
sudo systemctl stop nix-daemon.service
sudo systemctl disable nix-daemon.socket
sudo systemctl disable nix-daemon.service
sudo systemctl daemon-reload

# If you are on macOS, you will need to run:
sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
There may also be references to Nix in /etc/profile, /etc/bashrc, and /etc/zshrc which you may remove.
```


## Reference List {#reference-list}

1.  <https://nixos.org/manual/nix/stable/installation/installation.html>

