---
title: "Home Manager using Nix"
date: 2021-12-26T17:30:00+08:00
categories: ["Linux"]
draft: false
---

## Home Manager {#home-manager}


### Standalone installation {#standalone-installation}

1.  Add the appropriate Home Manager channel. If you are following Nixpkgs master or an unstable channel you can run.

    ```bash
       nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
        nix-channel --update
    ```

    ```bash
       cat ~/.nix-channels
       nix-channel --list
    ```

    Check your **echo $NIX\_PATH**, If your have NOT

    you may have to add

    ```bash
       export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

       /nix/var/nix/profiles/per-user/yanboyang713/channels


       export NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/yanboyang713/channels/nixpkgs:/nix/var/nix/profiles/per-user/yanboyang713/channels:~/.nix-defexpr/channels
    ```

    to your shell

2.  Run the Home Manager installation command and create the first Home Manager generation:

    ```bash

    ```


## Reference List {#reference-list}

1.  <https://github.com/nix-community/home-manager>
2.
