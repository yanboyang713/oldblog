# Getting Started with Doom Emacs

## Prerequisites
Git 2.23+
Emacs 27.1+ (27.2 is recommended, or native-comp).
ripgrep 11.0+
GNU find
OPTIONAL: fd 7.3.0+ (improves file indexing performance for some commands)

## Instation


Receive and send email (.mbsyncrc)
install
Install the isync package yaourt -S isync

Using GPG for mbsync passwords
The basic idea is that every time a password is needed, an particular file is decrypted and loaded. The key for the decryption can be prompted for and be stashed by gpg-agent. The first step is to create a GPG key, which is covered very well elsewhere. The standard authentication mechanism for gnus and smtpmail can be reused to store login information for mbsync. For any one account, the password for IMAP access and the password for sending email (usually the same) can be added to ~/.authinfo.gpg:

machine imap.gmail.com login MyAccountName@gmail.com password MYPASSWORD machine smtp.gmail.com login MyAccountName@gmail.com password MYPASSWORD The first line is used by mbsync and the second by smtpmail. The line: PassCmd “gpg2 -q –for-your-eyes-only –no-tty -d ~/.authinfo.gpg | awk ’machine imap.gmail.com login MyAccountName@gmail.com {print $NF}’”

