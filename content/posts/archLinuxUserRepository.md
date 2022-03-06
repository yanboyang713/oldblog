---
title: "Arch Linux Unofficial user repositories"
date: 2022-03-06T16:56:00+11:00
tags: ["unofficial", "user", "repository"]
categories: ["Linux"]
draft: false
---

## Introduction <span class="tag"><span class="archstrike">archstrike</span></span> {#introduction}

In Arch Linux, the common way to install new software is install software from official repositorie. But, on some of special fields, there are lots of unofficial user repositorie is avaliable.

For example, [archstrike](https://archstrike.org/) is a famous repository for security professionals and enthusiasts.

In this article, I will tech you how to use others repositorie and how to make you own repositorie for share your package with others person.


## Use others repositorie {#use-others-repositorie}

There are two categories of repositorie is often used: signed repositorie and unsigned repositorie.

In order to use these repositories, the common method is add them to **/etc/pacman.conf. If a repository is \*signed**, you must obtain and locally sign the associated key.

There is a example below to show you how to add community repositorie to your system and how to install those applications from your added repositorie.

The example about install **wechat** from Arch Linux Chinese community repositorie.


### Arch Linux Chinese Community Repository {#arch-linux-chinese-community-repository}


#### Usage {#usage}

Add repo:

```file
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch
```

to your /etc/pacman.conf .

For mirrors (strongly recommended for users in China), see <https://github.com/archlinuxcn/mirrorlist-repo>.

Import PGP Keys:

```bash
sudo pacman -Sy && sudo pacman -S archlinuxcn-keyring
```

Install Wechat:

```bash
yay -S wine-for-wechat
```


## Create your own custom repository <span class="tag"><span class="arch">arch</span><span class="linux">linux</span><span class="custom">custom</span><span class="repository">repository</span></span> {#create-your-own-custom-repository}


## Reference List {#reference-list}

1.  <https://wiki.archlinux.org/title/Unofficial_user_repositories>
