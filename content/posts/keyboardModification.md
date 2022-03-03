---
title: "Linux modification keys: ctrl and caps exchange"
date: 2022-03-03T16:17:00+11:00
tags: ["keyboard", "modification"]
categories: ["Linux"]
draft: false
---

## Introduction {#introduction}

The **ctrl** key is used more frequently than the key **caps**, but the position of the **ctrl** is not friendly to the little finger. The following introduces a simple methods to modify the key position.


## Set-up {#set-up}

Step 1: You need add below contents to you **/etc/profile**.

```file
setxkbmap -option "ctrl:swapcaps"
```

The quick way run the below **Script.**

```bash
#!/bin/sh
###############################################################
## AUTHOR Name: Boyang Yan                                   ##
## KEYWORDs: Keyboard, Modification                          ##
## PURPOSE: ctrl and caps exchange                           ##
## ENVIRONment: mac, Linux                                   ##
## COMMENTs:                                                 ##
## Last Modified Date: 03.03.2022                            ##
###############################################################

read -p "Do you want to swap ctrl-L and Caps keys (Y/n)? " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            ## swap ctrl-L and Caps when star-up
            echo "Swap ctrl-L and Caps when start-up !!!"
            echo -ne "\n#Swap ctrl-L and Caps when start-up\nsetxkbmap -option \"ctrl:swapcaps\"\n\n"  | tee -a ~/DotFiles/profile/profile
        fi
```


## Reference List {#reference-list}

1.  <https://opensource.com/article/18/11/how-swap-ctrl-and-caps-lock-your-keyboard>
