---
title: "Getting Started with Password Master (Bitwarden)"
date: 2020--5-24T06:11:32+10:00
tags: [ "Bitwarden" ]
categories: [ "Password Master" ]
---
## Introduction

## Installation

```bash
yay -S bitwarden-cli
```

```console
[yanboyang713@Boyang-PC ~]$ bw login
? Email address: yanboyang713@gmail.com
? Master password: [hidden]
You are logged in!

To unlock your vault, set your session key to the `BW_SESSION` environment variable. ex:
$ export BW_SESSION="082KKVK/t0NjLQ7AiFRkuC/G/4pilfC05UCXedpAILtyHfEs0jnZGPmIT43BVbcGUfnPgvUved7Z90+8Rk0vKg=="
> $env:BW_SESSION="082KKVK/t0NjLQ7AiFRkuC/G/4pilfC05UCXedpAILtyHfEs0jnZGPmIT43BVbcGUfnPgvUved7Z90+8Rk0vKg=="

You can also pass the session key to any command with the `--session` option. ex:
$ bw list items --session 082KKVK/t0NjLQ7AiFRkuC/G/4pilfC05UCXedpAILtyHfEs0jnZGPmIT43BVbcGUfnPgvUved7Z90+8Rk0vKg==
```

```bash
yay -S yarn npm
```

```bash
bash <(curl -s https://raw.githubusercontent.com/AZMCode/git-credential-bw/master/devScripts/install.sh)
```

```bash
sudo npm install -g tslib
```


