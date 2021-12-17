---
title: "Install Terrafom with Quick start tutorial"
date: 2021-12-17T17:39:00+08:00
tags: ["Terraform", "tutorial"]
categories: ["DevOps"]
draft: false
---

## Pre-reading {#pre-reading}

1.  [DevOps/DevOps Beginner's Guide]({{< relref "DevOps" >}})
2.  [DevOps/Terraform Beginner's Guide]({{< relref "terraform" >}})
3.  [DevOps/The comparison and introduction between Terraform and Ansible]({{< relref "terraformAndAnsible" >}})


## Install {#install}


### Arch Linux {#arch-linux}

```bash
yay -S terraform
```


### Ubuntu/Debian {#ubuntu-debian}

Ensure that your system is up to date, and you have the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature, and install HashiCorp's Debian package repository.

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

Add the HashiCorp GPG key.

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the official HashiCorp Linux repository.

```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update to add the repository, and install the Terraform CLI.

```bash
sudo apt-get update && sudo apt-get install terraform
```

**TIP**: Now that you have added the HashiCorp repository, you can install Vault, Consul, Nomad and Packer with the same command.


## Verify the installation {#verify-the-installation}

Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands.

```bash
terraform -help
```

Add any subcommand to terraform -help to learn more about what it does and available options.

```bash
terraform -help plan
```


## Troubleshoot {#troubleshoot}

If you get an error that **terraform** could not be found, your **PATH** environment variable was not set up properly. Please go back and ensure that your **PATH** variable contains the directory where Terraform was installed.


## Enable tab completion for ZSH {#enable-tab-completion-for-zsh}

You can enable tab completion for Terraform commands. To enable autocomplete, first ensure that a config file exists for your ZSH shell

```bash
touch ~/.zshrc
```

Then install the autocomplete package.

```file
terraform -install-autocomplete
```

Once the autocomplete support is installed, you will need to restart your shell.


## Reference List {#reference-list}

1.  <https://learn.hashicorp.com/tutorials/terraform/install-cli>
