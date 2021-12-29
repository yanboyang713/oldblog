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


### nix shell {#nix-shell}

First, let’s enter a shell that has GNU Hello from nixpkgs’ branch nixpkgs-unstable in it:

```bash
nix shell 'github:nixos/nixpkgs/nixpkgs-unstable#hello'
```

Note that this will start the same shell as you are running, but add a directory containing the hello executable to your **$PATH**.

For example:

**Before**:

```text
[yanboyang713@manjaro] ➜ ~ echo $PATH
/home/yanboyang713/.miniconda/bin:/home/yanboyang713/.fnm:/home/yanboyang713/.local/share/go/bin:/home/yanboyang713/.cargo/bin:/home/yanboyang713/.local/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/nix/store/wxrplk88a4k9cvam0fz2x6m7hl01cpd7-user-environment/bin:/home/yanboyang713/.nix-profile/bin:/home/yanboyang713/.miniconda/bin:/home/yanboyang713/.fnm:/home/yanboyang713/.local/share/go/bin:/home/yanboyang713/.cargo/bin:/home/yanboyang713/.local/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/home/yanboyang713/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/home/yanboyang713/.local/bin/:/home/yanboyang713/.nix-profile/bin/:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin
```

**After**:

```text
[yanboyang713@manjaro] ➜ ~ echo $PATH
/home/yanboyang713/.miniconda/bin:/home/yanboyang713/.fnm:/home/yanboyang713/.local/share/go/bin:/home/yanboyang713/.cargo/bin:/home/yanboyang713/.local/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/nix/store/xcp9cav49dmsjbwdjlmkjxj10gkpx553-hello-2.10/bin:/home/yanboyang713/.miniconda/bin:/home/yanboyang713/.fnm:/home/yanboyang713/.local/share/go/bin:/home/yanboyang713/.cargo/bin:/home/yanboyang713/.local/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/nix/store/wxrplk88a4k9cvam0fz2x6m7hl01cpd7-user-environment/bin:/home/yanboyang713/.nix-profile/bin:/home/yanboyang713/.miniconda/bin:/home/yanboyang713/.fnm:/home/yanboyang713/.local/share/go/bin:/home/yanboyang713/.cargo/bin:/home/yanboyang713/.local/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/home/yanboyang713/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/home/yanboyang713/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/home/yanboyang713/.local/bin/:/home/yanboyang713/.nix-profile/bin/:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin
```

you can found:

```text
/nix/store/xcp9cav49dmsjbwdjlmkjxj10gkpx553-hello-2.10/bin
```

The shell shouldn’t look any different from how it was outside the nix shell, so don’t panic if it looks like nothing is happening! The executable is not installed anywhere per se, it gets downloaded and unpacked in what you can consider a cache directory.

Now, inside that shell, try running **hello**.

Let’s go through what this command does. **nix shell** is a nix subcommand that is used to run a shell with some packages available in **$PATH**. Those packages can be specified as arguments in the "**installable**" format. Each installable contains two parts: the URL (**github:nixos/nixpkgs/master** in this case) and an "attribute path" (**hello** here).

There are a few URL schemes supported:

-   github:owner/repo/[revision or branch] and gitlab:owner/repo/[revision or branch] (for public repositories on github.com and gitlab.com; note that that the branch name cannot contain slashes).
-   <https://example.com/path/to/tarball.tar.gz> for tarballs.
-   git+<https://example.com/path/to/repo.git> and git+ssh://example.com/path/to/repo.git for plain git repositories (you can, of course, use this for GitHub and GitLab). You can specify the branch or revision by adding ?ref=&lt;branch name here&gt;.
-   </path/to/directory> or /path/to/directory or ./path/to/relative/directory for a local directory.
-   flake-registry-value for a value from a flake registry (I won’t talk about flake registries in this article).

So, there are some other ways to get the same shell:

```bash
nix shell 'https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz#hello'
nix shell 'git+https://github.com/nixos/nixpkgs?ref=nixpkgs-unstable#hello'
nix shell 'nixpkgs#hello' # nixpkgs is specified in the default registry to be github:nixos/nixpkgs
```

As for the attribute path, for now, just know that it’s a period-separated list of Nix "**attribute names**" that selects a flake output according to some simple logic.

Note that in this case, Nix did not have to build anything since it could just fetch GNU Hello and its dependencies from the binary cache. To achieve this, Nix evaluates a derivation from the expression, hashes its contents, and queries all the caches it knows to see if someone has the derivation with this hash cached. Nix uses all the dependencies and all the instructions as the input for this hash! If some binary cache has a version ready, it can be substituted (downloaded). Otherwise, Nix will build the derivation by first realising (substituting or building) all the dependencies and then executing the build instructions.

You might be wondering where exactly is the executable installed. Well, try **command -v hello** to see that it is located in a subdirectory of **/nix/store**. In fact, all Nix derivations have "**store paths**" (paths located in /nix/store) as inputs and outputs.


### nix build {#nix-build}

If you just want to build something instead of entering a shell with it, try **nix build**:

```bash
nix build 'nixpkgs#hello'
```

This will build Hello (or fetch it from the binary cache if available) and then symlink it to result in your current directory. You can then explore result, e.g.

```console
[yanboyang713@manjaro] ➜ ~ ls -la
lrwxrwxrwx  1 yanboyang713 yanboyang713    54 Dec 29 11:11  result -> /nix/store/xcp9cav49dmsjbwdjlmkjxj10gkpx553-hello-2.10
```

```console
$ ./result/bin/hello
Hello, world!
```


### nix develop {#nix-develop}

Despite the use of binary caches, Nix is a sourcecode-first package manager. This means that it has the ability to provide a build environment for its derivations. So, you can use Nix to manage your build environments for you! To enter a shell with all runtime and buildtime dependencies of GNU Hello, use:

```bash
nix develop 'nixpkgs#hello'
```

Inside that shell, you can call **unpackPhase** to place GNU Hello sources in the current directory, then **configurePhase** to run **configure** script with correct arguments and finally **buildPhase** to build.


### nix profile {#nix-profile}

Nix implements stateful "profiles" to allow users to "**permanently**" install stuff.

For example:

```bash
nix profile install 'nixpkgs#hello'
nix profile list
nix profile update hello
nix profile remove hello
```

If you’re already familiar with Nix, this is a replacement for **nix-env**.


### nix flake {#nix-flake}

**nix flake** set of subcommands is used to observe and manipulate flakes themselves rather than their outputs.


#### nix flake show {#nix-flake-show}

This command takes a flake URI and prints all the outputs of the flake as a nice tree structure, mapping attribute paths to the types of values.

For example:

```console
[yanboyang713@manjaro] ➜ ~ nix flake show github:nixos/nixpkgs
github:nixos/nixpkgs/41d4fbf65287038fcd88fce734282e522e2a6d33
├───checks
│   └───x86_64-linux
│       └───tarball: derivation 'nixpkgs-tarball-22.05pre20211229.41d4fbf'
├───htmlDocs: unknown
├───legacyPackages
warning: │   ├───aarch64-darwin: omitted (use '--legacy' to show)
warning: │   ├───aarch64-linux: omitted (use '--legacy' to show)
warning: │   ├───armv6l-linux: omitted (use '--legacy' to show)
warning: │   ├───armv7l-linux: omitted (use '--legacy' to show)
warning: │   ├───i686-linux: omitted (use '--legacy' to show)
warning: │   ├───mipsel-linux: omitted (use '--legacy' to show)
warning: │   ├───x86_64-darwin: omitted (use '--legacy' to show)
warning: │   └───x86_64-linux: omitted (use '--legacy' to show)
├───lib: unknown
└───nixosModules
    └───notDetected: NixOS module
```


#### nix flake clone {#nix-flake-clone}

**nix flake clone** will clone the flake source to a local directory, similar to **git clone**.

Let’s clone some simple flake and use some other **nix flake** subcommands on it:

```bash
nix flake clone git+https://github.com/balsoft/hello-flake/ -f hello-flake
cd hello-flake
```


#### nix flake lock (**previously** nix flake update) {#nix-flake-lock--previously-nix-flake-update}

Every time you call a Nix command on some flake in a local directory, Nix will make sure that the contents of **flake.lock** satisfy the **inputs** in **flake.nix**. If you want to do just that, without actually building (or even evaluating) any outputs, use **nix flake lock**.

There are also some arguments for flake input manipulation that can be passed to most Nix commands:

-   **--override-input** takes an input name that you have specified in **inputs** of **flake.nix** and a flake URI to provide as this input; - **--update-input** will take an input name and update that input to the latest version satisfying the flake URI from **flake.nix**.


## Writing your own {#writing-your-own}

Now that you know how to interact with flakes, it’s time to write one.


### Nix language refresher {#nix-language-refresher}

The widely used data type in Nix is an attribute set: a data type for storing key-value pairs. It is similar to a JSON object or a hashmap in many languages. Its syntax is confusingly similar to a list of statements in C-like languages:

```text
{
  hello = "world";
  foo = "bar";
}
```

The set above is equivalent to this JSON object:

```text
{
    "hello": "world",
    "foo": "bar"
}
```

**hello** and **foo** are commonly referred to as "attributes" or "attribute names"; **"world"** and **"bar"** are "attribute values".

To get an attribute value from an attribute set, use .. For example:

```text
let
  my_attrset = { foo = "bar"; };
in my_attrset.foo
```

(**let ... in** is a way to create bindings; the syntax inside it is identical to that of an attribute set)

You can also abbreviate your attribute set by setting specific attributes with . instead of defining the entire set:

```text
{
  foo.bar = "baz";
}
```

Is equivalent to

```text
{
  foo = { bar = "baz"; };
}
```

Other types include strings (**"foo"**), numbers (1, 3.1415), heterogenous lists (**[ 1 2 "foo" ]**) and – quite importantly – functions (**x: x + 1**).

Functions support pattern matching on attribute sets. For example, this function:

```text
{ a, b }: a + b
```

When called with **{ a = 10; b = 20; }** will return 30.

Function application is done in ML style:

```text
let
  f = { a, b }: a + b;
in f { a = 10; b = 20; }
```

The function itself comes first. Then there is a whitespace-separated list of arguments.

If you want to have a function of multiple arguments, use currying:

```text
let
  f = a: b: a + b;
in f 10 20
```

In this example, **f 10** evaluates to **b: 10 + b**, and then **f 10 20** evaluates to **30**.

If you want to learn more about Nix, check out the [corresponding manual section](https://nixos.org/manual/nix/stable/expressions/writing-nix-expressions.html) and [Nix Pills](https://nixos.org/guides/nix-pills/).


### Basic flake structure {#basic-flake-structure}

The language description you got above is far from complete or formal, but it should help you understand and, more importantly, write some simple Nix expressions and, even more importantly, a flake.

A Nix flake is a directory that contains a flake.nix file. That file must contain an attribute set with one required attribute – outputs – and optionally description and inputs.

outputs is a function that takes an attribute set of inputs (there’s always at least one input – self – which refers to the flake that Nix is currently evaluating; this is possible due to laziness). So, the most trivial flake possible is this:

```text
{
  outputs = { self }: { };
}
```


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
