---
title: "Nix Flakes"
date: 2021-12-28T11:23:00+08:00
tags: ["nix", "Flakes"]
categories: ["Nix"]
draft: false
---

## Introduction {#introduction}

Nix Flakes are an upcoming feature of the Nix package manager.

Flakes replace stateful channels (which cause much confusion among novices) and introduce a more intuitive and consistent CLI, making them a perfect opportunity to start using Nix.

It contains examples and advice on using flakes for a real-life use case: building applications in various languages.


## Pre-reading {#pre-reading}

1.  [Nix/Getting Started with Nix]({{< relref "nix" >}})


## Installing flakes {#installing-flakes}

In order to do anything with flakes, you will first have to get “unstable” Nix up and running on your machine. Don’t mind that it is called unstable: it is not generally dangerous to run on your machine, it simply changes more often than “stable”.

If you have NOT install **NIX**, please following this [Nix/Nix Installation]({{< relref "nixInstallation" >}}).

For **Non-NixOS**, Follow the instructions until you have Nix working on your machine, and then update to unstable with:

```bash
#On non-nixos systems, install nixFlakes in your environment:
nix-env -iA nixpkgs.nixUnstable
```

And enable experimental features. Edit either **~/.config/nix/nix.conf** or **/etc/nix/nix.conf** and add:

I recommend:

```bash
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

This is needed to expose the Nix 2.0 CLI and flakes support that are hidden behind feature-flags.

Finally, if the Nix installation is in multi-user mode, don’t forget to restart the nix-daemon.

```bash
sudo systemctl stop nix-daemon.socket
sudo systemctl stop nix-daemon.service
sudo systemctl start nix-daemon.socket
sudo systemctl start nix-daemon.service
```


## Getting a feel for flakes {#getting-a-feel-for-flakes}

Now that you have a “flaky” Nix installed, it’s time to use it!

<https://serokell.io/blog/practical-nix-flakes>


## What are Nix flakes? {#what-are-nix-flakes}

Flakes are self-contained units that have inputs (dependencies) and outputs (packages, deployment instructions, Nix functions for use in other flakes). You can think about them as Rust crates or Go modules but language-independent. Flakes have great reproducibility because they are only allowed to depend on their inputs and they pin the exact versions of said inputs in a lockfile.

If you’re already familiar with Nix, flakes are to Nix expressions what derivations are to build instructions.

Flakes allow you to specify your code's dependencies (e.g. remote Git repositories) in a declarative way, simply by listing them inside a **flake.nix** file:

```text
{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
  };
}
```

Each dependency gets then pinned, that is: its commit hash gets automatically stored into a file - named flake.lock - making it easy to, say, upgrade it:

```bash
nix flake lock --update-input home-manager
```

(if you're familiar with modern packages managers like cargo or npm, then the overall mechanism shouldn't surprise you - Nix works in a similar way, although without a centralized repository.)

Flakes replace the nix-channels command and things like ad-hoc invocations of builtins.fetchgit - no more worrying about keeping your channels in sync, no more worrying about forgetting about a dependency deep down in your tree: everything's at hand right inside flake.lock.


## Reference List {#reference-list}

1.  <https://serokell.io/blog/practical-nix-flakes>
