---
title: "Getting started with Rust"
categories: ["Rust"]
draft: true
---

## Introduction {#introduction}

Rust.


## Installing Rust {#installing-rust}

Rustup: the Rust installer and version management tool. The primary way that install **Rust** is use [rustup](https://rustup.rs/), which is a Rust installer and version management tool, as this makes it easy to use the nightly toolchain.

It can be running on macOS, Linux, or another Unix-like OS. To download Rustup and install Rust, run the following in your terminal, then follow the on-screen instructions.

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

To get started you may need to restart your current shell.
This would reload your PATH environment variable to include
Cargo's bin directory ($HOME/.cargo/bin).

To configure your current shell, run:

```bash
source $HOME/.cargo/env
```

File **$HOME/.cargo/env**:

```bash
#!/bin/sh
# rustup shell setup
# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac
```


## Update Rust {#update-rust}

Rust updates very frequently. If you have installed Rustup some time ago, chances are your Rust version is out of date. Get the latest version of Rust by running.

```bash
rustup update
```


## Test cargo installed {#test-cargo-installed}

```bash
cargo --version
```


## Reference List {#reference-list}

1.  <https://www.rust-lang.org/learn/get-started>
