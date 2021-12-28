# Getting Started with Nix


## Introduction {#introduction}

The NixOS package manager is a system of its own. You can use it under any Linux Distribution.


## What is Nix? {#what-is-nix}

Briefly speaking, Nix is a package manager and a build system. Its most important aspect is allowing to write declarative scripts for reproducible software builds. It also helps to test and deploy software systems while using the functional programming paradigm. There is a vast repository of packages for Nix called [nixpkgs](https://github.com/nixos/nixpkgs), and a GNU/Linux distribution that extends the ideas of Nix to the OS level called [NixOS](https://nixos.org/).

Nix building instructions are called “derivations” and are written in Nix, the programming language. Derivations can be written for packages or even entire systems. After that, they can then be deterministically “realised” (built) via Nix, the package manager. Derivations can only depend on a pre-defined set of inputs, so they are somewhat reproducible.

You can read more about the benefits of Nix in my blog post on [Nix](https://serokell.io/blog/what-is-nix).


## What does NixOS Package Manager do? {#what-does-nixos-package-manager-do}

Most package managers use a file that contains the executable or source code. They then calculate what it needs on the system and then make sure that it exists. In Nix, things work very similarly. The big difference is that Nix creates all the files, and compiles them if necessary, then put them in one place; the nix-store. The first question you have may be, “Will the files not have the same name?” The system avoids this by having one directory for each version AND naming all files with a hash. To make the application “feel at home”, all dependencies are then linked to their correct directories using ordinary symlinks. A profile keeps track of which version each user runs.


## NixOS User Installs {#nixos-user-installs}

With this system, you can have different versions installed in each user’s directory. If they are the same in several users, the administrator can let Nix re-link binaries, so only one exists at a time. This is useful in saving disk space. You can also create specific environments for each version of the package. This is especially useful when you want to test a new version or develop software.


## Installing for common distribution {#installing-for-common-distribution}

[Linux/Nix Installation]({{< relref "nixInstallation" >}})


## Adding your first program to NixOS {#adding-your-first-program-to-nixos}

To install software and set when it can be used, you have nix-env. The install option (-i) is the most common one since you use it always and put a package as an argument.

```bash
nix-env -i firefox
```

This looks the same as in other distributions, so does the query argument. The install will take some time, though. The reason is that it must compile the software unless there is a pre-compiled version in the Nix Cache. Reaching the cache is not always very fast either. There is a difference that you should take note of; you can pick a version! If you want a special version, you must find which are available using regular expressions.

```bash
nix-env -qa 'firefox.*'
```

You will receive a list of all the available packages. You can install it the same way but using the value in the list.

```bash
nix-env –install 'firefox-78.4.0ser' –preserve-installed
```

This can fail if you already have an installed version. Option ‘–preserve-installed’ will not erase the installed version. You may end up with two versions of the same priority, which you can fix by setting the priority.

```bash
nix-env –set-flag priority 2 'firefox-82.0.2'
```

Now, you will run the old version the next time you start Firefox. To switch which one you run, you can set the priority accordingly. You can also start a shell to choose a binary. This is a developer’s option, and the command is nix-shell.


## Updating NixOS {#updating-nixos}

Once you have a collection of software, you want to stay updated. Same as always, you use the same command with an argument. But you must also keep the channel updated. The command is nix-channel.

```bash
nix-channel --update
```

This reads down the current versions of all packages available. After that, you can start upgrading your software with nix-env.

```bash
nix-env --upgrade
```

An upgrade like this will upgrade your old version of the software. In this case, the old Firefox will be replaced with the newest version. You may not want this for whatever reason, usually development.


## Removing applications from NixOS {#removing-applications-from-nixos}

Removing applications is equally simple, with a small caveat. No applications are removed by a remove command.

```bash
nix-env –uninstall 'firefox-78.4.0ser'
```

This command will remove the links to the current build of this version of Firefox. All the files will always stay on disk. You have these versions available to do a rollback. A rollback means that you go back to using the old version. This can be useful if you have tried the newest and it has unforeseen problems.

```bash
nix-env –rollback
```

You rollback an entire generation, which means all the programs that were upgraded since the last generation. The option runs two commands; that list and then switches to that old generations. All installed packages exist in a generation on disk.


## NixOS Roll-back and Cleaning up {#nixos-roll-back-and-cleaning-up}

The rollback function will lead to a lot of disk space being used by old versions. You can clean this up (you need to clean this up!). When you have had a long enough period, at your own choice, you can also clean up these old generations to save disk space.

```bash
nix-env –delete-generations old
```

With this command, you delete all generations except the two last ones. You can go back and forth in the list with more complex parameters to leave the specific generation that worked best for you. Unless you have many testing or development projects that need many versions for testing, you should use a scheduled removal of all old generations.

A simple script to keep your generations clean comes with a Nix package manager install.

```bash
nix-collect-garbage
```

You should also set up the collector to run automatically using systemd or other systems.


## Conclusion {#conclusion}

Nix package manager is a powerful system that can get you running complex development environments on your machine. You can also use it to keep your software tidy and have a simple way to recover on a new machine, should the catastrophe of a disk crash occur.


## Reference List {#reference-list}

1.  <https://linuxhint.com/how-to-use-nixos-package-manager/>
2.  <https://serokell.io/blog/what-is-nix>
3.  <https://github.com/NixOS/nix>
4.  <https://nixos.org/learn.html>

