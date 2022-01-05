# Pipe to/from the clipboard in a Bash script


## Introduction {#introduction}

The **clipboard** is a buffer that operating systems provide for short-term storage and transfer within and between application programs.

The clipboard provides an application programming interface by which programs can specify cut, copy and paste operations.

In the Post, I will introduct how to using **xclip** in **Bash Script**.


## Installion {#installion}


### Linux {#linux}

```bash
# You can install xclip using `apt-get`
apt-get install xclip

# or `pacman`
pacman -S xclip

# or `dnf`
dnf install xclip
```


## Set-up {#set-up}


### Bash {#bash}

In ~/.bash\_aliases, add:

```text
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
```

Do not forget to load your new configuration using **. ~/.bash\_aliases** or by restarting your profile.


### Fish {#fish}

In **~/.config/fish/config.fish**, add:

```text
abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"
```

Do not forget to restart your fish instance by restarting your terminal for changes to apply.


## Usage {#usage}

You can now use setclip and getclip, e.g:

```console
$ echo foo | setclip
$ getclip
foo
```

