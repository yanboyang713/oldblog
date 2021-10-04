# Getting Started with Doom Emacs

## Prerequisites
### Instation Dependencies
#### Arch Linux
```bash
# required dependencies
pacman -S git emacs ripgrep
# optional dependencies
pacman -S fd
yay -S emacs-pdf-tools-git
```

With Emacs and Doom’s dependencies installed, next is to install Doom Emacs itself:


Receive and send email (.mbsyncrc)
install
Install the isync package yaourt -S isync

Using GPG for mbsync passwords
The basic idea is that every time a password is needed, an particular file is decrypted and loaded. The key for the decryption can be prompted for and be stashed by gpg-agent. The first step is to create a GPG key, which is covered very well elsewhere. The standard authentication mechanism for gnus and smtpmail can be reused to store login information for mbsync. For any one account, the password for IMAP access and the password for sending email (usually the same) can be added to ~/.authinfo.gpg:

machine imap.gmail.com login MyAccountName@gmail.com password MYPASSWORD machine smtp.gmail.com login MyAccountName@gmail.com password MYPASSWORD The first line is used by mbsync and the second by smtpmail. The line: PassCmd “gpg2 -q –for-your-eyes-only –no-tty -d ~/.authinfo.gpg | awk ’machine imap.gmail.com login MyAccountName@gmail.com {print $NF}’”

