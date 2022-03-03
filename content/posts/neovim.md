---
title: "Getting Started with NeoVim"
date: 2022-01-06T18:36:00+11:00
categories: ["Editor"]
draft: false
---

## What is NeoVim? {#what-is-neovim}

If you are a **system administrator** or a **software developer**, a **robust** text editor is among the tools you use on a daily basis. It’s likely that you’ve used the **vi** or **vim** editors that have served the Unix and Linux communities for decades.

Although **vim** is under active development, it includes some ~300k lines of C89 code. In addition to being difficult to maintain, issues and new pull requests cannot be addressed very easily since Bram Moolenaar is the only person who maintains the large codebase of the program.

These difficulties, along with the lack of support for some desired features such as asynchronous plugins, motivated the birth of **NeoVim** as a fork of vim. The project’s main objective is to completely refactor **vim** so that maintenance can be simplified, and new features and bug fixes can be quickly added to the source code.


## What To Expect From NeoVim? {#what-to-expect-from-neovim}

During **NeoVim** ’s short life, two outstanding features have already been implemented:

-   asynchronous plugins
-   Remote Procedure Call (RPC) API for controlling NeoVim programmatically.

**Asynchronous plugins** make it possible for plugins to run as background processes without interfering with the main editor process.

**The RPC API** allows GUI programs (and other software that speaks the msgpack-rpc messaging protocol) to connect to a running NeoVim instance. This means that you can integrate well-known text editors such as Atom, Visual Studio Code, or Sublime Text with NeoVim and have modifications sync bidirectionally between them. That way, you can leverage all the features of the GUI program while using nvim’s engine behind the scenes.

This **guide** details the **installation** and **configuration** of NeoVim.


## Installion {#installion}


### Arch linux {#arch-linux}

```bash
yay -S neovim
```


## Install the Vim-plug Plugin Manager {#install-the-vim-plug-plugin-manager}

To make it easier to install plugins, use the [Vim-plug plugin manager](https://github.com/junegunn/vim-plug). This plugin manager uses git to manage most plugins.

-   Unix, Linux

    ```bash
      sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```


## Import Existing NeoVim Configuration {#import-existing-neovim-configuration}

I recommend you using **Make** to management all of your dotfiles, include the configuration of **NeoVim**, the details please have a look [Linux/Managing Your Dotfiles With Git and Make]({{< relref "#d41d8c" >}}).

You also can found my NeoVim configuration in [HERE](https://github.com/yanboyang713/DotFiles/blob/main/nvim/init.vim).


## Install NeoVim Plugins {#install-neovim-plugins}

Launch nvim, execute **PlugInstall**, update the plugins, and exit:

```text
nvim
:PlugInstall
:UpdateRemotePlugins
:q!
:q!
```


## Set Environment Variable {#set-environment-variable}

There are two **environment variable** should be sufficient in most cases.

**VISUAL** is used to specify the "visual" - screen-oriented - editor.
Generally you will want to set it to the same value as the **EDITOR** variable.

```text
EDITOR=nvim
VISUAL=nvim
```


## Plugins {#plugins}


### coc.nvim Plugged <span class="tag"><span class="coc">coc</span><span class="nvim">nvim</span></span> {#coc-dot-nvim-plugged}

If you faced below error message.

{{< figure src="http://res.cloudinary.com/dkvj6mo4c/image/upload/v1641468862/screenshot/usfnmxvdpqkhfqlbgjg1.png" >}}

The solution is:

```bash
yay -S nodejs
sudo npm install -g yarn
# Go to your coc.nvim plugged DIR
cd ~/.config/nvim/plugged/coc.nvim
yarn install
yarn build
```


## Install bash script {#install-bash-script}

I write a bash script for doing all of those thing.

```bash
#!/bin/bash
# Bash Menu Script
###############################################################
## AUTHOR Name: Boyang Yan                                   ##
## KEYWORDs: Init set-up NVIM                                ##
## PURPOSE: Init Set-up NVIM                                 ##
## ENVIRONment: mac, Linux                                   ##
## COMMENTs:                                                 ##
## Last Modified Date: 03.02.2022                            ##
###############################################################

echo "Let's we start set-up NVIM"

## Details at https://www.yanboyang.com/neovim/

## Pre-requised Install
sudo pkgfile --update
sudo pacman --noconfirm -S --needed nodejs neovim

## Install the Vim-plug Plugin Manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Import Existing NeoVim Configuration
mkdir $HOME/.config/nvim/
ln -vsf $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

## Install NeoVim Plugins
nvim --headless +'PlugInstall --sync' +'UpdateRemotePlugins' +qall

## Install coc.nvim Plugged
npm -g list yarn || sudo npm install -g yarn

# Go to your coc.nvim plugged DIR
cd ~/.config/nvim/plugged/coc.nvim
yarn install
yarn build
```

Link: <https://github.com/yanboyang713/DotFiles/blob/main/Scripts/nvim>


## Reference List {#reference-list}

1.  <https://www.cnblogs.com/sober-orange/p/cocnvim-build-indexjs.html>
2.  <https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/>
