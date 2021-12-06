# Getting Started with send and receive Email with Doom Emacs


## Receive Email {#receive-email}

```console
yay -S mu mbsync-git
```

<https://devanswers.co/create-application-specific-password-gmail/>

```console
gpg2 -c xxxxxxx
```

```console
time mu init --maildir=~/MailDir --my-address='yanboyang713@gmail.com'
mu index

time mbsync -c ~/.config/mu4e/mbsyncrc -a
```

[yanboyang713@Boyang-PC] ➜ ~ time mu init --maildir=~/MailDir --my-address='yanboyang713@gmail.com'
error: failed to open store @ _home/yanboyang713_.cache/mu/xapian: Unable to get write lock on _home/yanboyang713_.cache/mu/xapian: already locked
mu init --maildir=~/MailDir --my-address='yanboyang713@gmail.com'  0.00s user 0.00s system 66% cpu 0.006 total
[yanboyang713@Boyang-PC] ➜ ~ mu index
error: failed to open store @ _home/yanboyang713_.cache/mu/xapian: Unable to get write lock on _home/yanboyang713_.cache/mu/xapian: already locked

pkill -2 -u $UID mu
sleep 1
mu index

Using GPG for mbsync passwords
The basic idea is that every time a password is needed, an particular file is decrypted and loaded. The key for the decryption can be prompted for and be stashed by gpg-agent. The first step is to create a GPG key, which is covered very well elsewhere. The standard authentication mechanism for gnus and smtpmail can be reused to store login information for mbsync. For any one account, the password for IMAP access and the password for sending email (usually the same) can be added to ~/.authinfo.gpg:

machine imap.gmail.com login MyAccountName@gmail.com password MYPASSWORD machine smtp.gmail.com login MyAccountName@gmail.com password MYPASSWORD The first line is used by mbsync and the second by smtpmail. The line: PassCmd “gpg2 -q –for-your-eyes-only –no-tty -d ~/.authinfo.gpg | awk ’machine imap.gmail.com login MyAccountName@gmail.com {print $NF}’”


## Send Email {#send-email}

```console
yay -S msmtp msmtp-mta s-nail
```

echo "hello there username." | msmtp -a default username@domain.com

~/.mailrc
set mta=/usr/bin/msmtp


## Doom Emacs Set-up {#doom-emacs-set-up}

(package! mu4e)


## Usage {#usage}

<https://cheatography.com/ddoherty03/cheat-sheets/mu4e-with-gmail-hints/>

