# Home Manager using Nix


## Standalone installation {#standalone-installation}

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
       nix-shell '<home-manager>' -A install
    ```

Once finished, Home Manager should be active and available in your user environment.

1.  If you do not plan on having Home Manager manage your shell configuration then you must source the

    ```text
       $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    ```

file in your shell configuration.
This file can be sourced directly by POSIX.2-like shells such as Bash or Z shell

For example, if you use Bash then add

```text
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

to your ~/.profile file.

You can test that everything worked by typing

```bash
home-manager
```

Congratulations, you are ready to go!


## Getting started Home Manager {#getting-started-home-manager}

As you have seen in the install prompt, by default Home Manager initializes a new configuration in

```bash
$HOME/.config/nixpkgs/home.nix
```

that should look roughly like this

```text
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yanboyang713";
  home.homeDirectory = "/home/yanboyang713";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
```

Your use of Home Manager is centered around the configuration file.

This configuration file can be built and activated.

```bash
home-manager build
```

Once a configuration is successfully built, it can be activated. The activation performs the steps necessary to make the files, programs, and services available in your user environment.

```bash
# The command performs a combined build and activation
home-manager switch
```


## Git-it {#git-it}

The first step is to move this configuration to a git repository, I prefer to have it in a different location and use symlinks to expose it to Home Manager.

Run:

```bash

mv ~/.config/nixpkgs ~/nixfiles
cd ~/nixfiles
git init
git add .
git commit -m 'getting started with Home Manager'
cd ~/.config
ln -s ~/nixfiles nixpkgs
```

Then test that you can apply the configuration.

```bash
home-manager switch
```

We have not added anything so this should be a no-op.

Home Manager will let you know that it’s "reusing lastest profile generation".


## Let’s add our first package {#let-s-add-our-first-package}

First let’s see how we can use Home Manager to install packages for our user. In this example we’ll add tmux. Edit ~/nixfiles/home.nix as follows:

```text
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yanboyang713";
  home.homeDirectory = "/home/yanboyang713";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
```

Then run

```bash
home-manager switch
```

And now try it out

```bash
htop
```

A great place to search for packages is <https://search.nixos.org/packages>, make sure you pick the right “channel”, if you are following this guide it will be unstable.


## What is this home-manager switch business? {#what-is-this-home-manager-switch-business}

**home-manager switch** is how you "**activate**" your configuration. Home Manager will evaluate your configuration, build the result and **atomically** switch your old configuration with the new one.

This also means that it’s possible to see all old configurations

```console
[yanboyang713@manjaro] ➜ nixpkgs home-manager generations
2021-12-26 19:53 : id 2 -> /nix/store/hgma8yixml6ngwizw31sxdj9n08kmkfg-home-manager-generation
2021-12-26 17:55 : id 1 -> /nix/store/1xkax9m57lbyrcvhybpksqsga28injsf-home-manager-generation
```

And you can rollback to older versions as well.

```text
# copy the path from the command above and add /activate
/nix/store/1xkax9m57lbyrcvhybpksqsga28injsf-home-manager-generation/activate
...

# this will create a new generation
Creating profile generation 3
...
```

You can then switch again to re-apply your changes to go back to the current version of home.nix.

```bash
home-manager switch
```


## Porting over an existing dotfile {#porting-over-an-existing-dotfile}

So far we saw how to use Home Manager to install packages for our user, but a perhaps more important use case is manage our user configuration.

First we’ll see how to take an existing configuration file and make it part of Home Manager.

The simplest way to do this is to use the **home.file** option.

Assume that you have a **~/.vimrc** with the following contents:

```text
call plug#begin()
Plug 'LnL7/vim-nix'
call plug#end()
```

First let’s move it in our nixfiles repo

```bash
mv ~/.vimrc ~/nixfiles/vimrc
```

You can then edit ~/nixfiles/home.nix as follows

```text
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yanboyang713";
  home.homeDirectory = "/home/yanboyang713";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
  ];

  # Raw configuration files
  home.file.".vimrc".source = ./vimrc;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
```

And run **home-manager switch** again.
Now, let’s check what happened

```console
[yanboyang713@manjaro] ➜ nixpkgs ls -l ~/.vimrc
lrwxrwxrwx 1 yanboyang713 yanboyang713 69 Dec 27 13:49 /home/yanboyang713/.vimrc -> /nix/store/mfjw8j9c04wp9zxj4g6xj83jcxlld045-home-manager-files/.vimrc
```

/.vimrc is now a symlink to a file in the “Nix store”, the place where all the nix things go. Without concering ourself with details, the thing to notice is that if you now change the contents of ~/nixfiles/vimrc and re-run home-manager switch Home Manager will detect the changes, create a new version of .vimrc in the Nix store and update the symlink.

```console
$ echo "hello nix" > ~/nixfiles/vimrc
$ home-manager switch
$ ls -l ~/.vimrc
lrwxrwxrwx 1 ghedamat ghedamat 69 Apr  3 05:47 /home/ghedamat/.vimrc -> /nix/store/dsq0da2y4p7w67imwnd95crv4k35d6qb-home-manager-files/.vimrc
```

It is true that managing configuration in this way will add a step every time you want to edit your vimrc. I believe that this tradeoff is worth it even if you were to decide to not use any other feature offered by Home Manager as you now have a reliable and consistent way to manage all your configuration files and packages.


## Using Home Manager modules {#using-home-manager-modules}

Using the **home.file** configuration option is my preferred way to port existing configuration files. Once that’s done though Home Manager has much more to offer.

Home Manager comes with a large amount of pre-defined configuration **modules** for a variety of applications ([full list on github](https://github.com/nix-community/home-manager/tree/master/modules)). These modules allow you to use a consistent syntax (the Nix language) to configure every application regardless of the output format that each program requires (ini, yaml, custom…).

By using modules you will get **type safety guarantees** about your configuration as it will be now written in Nix and the modules can specify types for each option you pass. This also means that **you can use the Nix language to add logic** (i.e conditionals and functions) as well as the ability to compose your configuration as you would with any other functional program written in Nix.

The downside is that you have to learn at least a small part of the Nix language (mostly how to write sets, which are similar to maps and hash in other languages).

Once you have identified a module you are interested in, all the options available are listed in the [Home Manager Manual](https://nix-community.github.io/home-manager/).


### Porting your git config {#porting-your-git-config}

Let’s see an example with porting over our **~/.config/git/config** to Home Manager.

[user]
	email = ghedamat@gmail.com
	name = ghedamat
[alias]
	st = "status"

Edit **home.nix** as follows (you can find the full list of options for **programs.git** [here](https://nix-community.github.io/home-manager/options.html#opt-programs.git.enable))

```text
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yanboyang713";
  home.homeDirectory = "/home/yanboyang713";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
  ];

  # Raw configuration files
  home.file.".vimrc".source = ./vimrc;

  # Git config using Home Manager modules
  programs.git = {
     enable = true;
     userName = "Boyang Yan";
     userEmail = "yanboyang713@gmail.com";
     aliases = {
        st = "status";
     };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
```

Let’s try to apply this change

```bash
home-manager switch
```

We can verify that the file is now generated by Home Manager (notice the content is slightly different)

```console
$ cat ~/.config/git/config
[alias]
        st = "status"

[user]
        email = "yanboyang713@gmail.com"
        name = "Boyang Yan"
```


## Structuring your Home Manager config {#structuring-your-home-manager-config}

The author of Home Manager recommends to start with a single home.nix file and I would definitely agree. As you learn more about the Nix language you’ll find about all the different ways to structure your code.

Later, you might want to learn about using imports to break down your configuration into multiple files. A more advance approach is to build your own Nix modules.

I might decide to cover these in a future post.


## Reference List {#reference-list}

1.  <https://github.com/nix-community/home-manager>
2.  <https://nix-community.github.io/home-manager/index.html#sec-install-standalone>
3.  <https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix>

