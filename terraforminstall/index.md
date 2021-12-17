# Install Terrafom with Quick start tutorial


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

You can enable tab completion for Terraform commands.

To enable autocomplete, first ensure that a config file exists for your ZSH shell

```bash
touch ~/.zshrc
```

Then install the autocomplete package.

```file
terraform -install-autocomplete
```

Once the autocomplete support is installed, you will need to restart your shell.

**Importance NOTE**: If you want to use the same configuration on your different computers and VMs, please read [Linux/Managing Your Dotfiles With Git and Make]({{< relref "dotfiles" >}}).


## Quick start tutorial {#quick-start-tutorial}

Now that you've installed Terraform, you can provision an NGINX server in less than a minute using Docker on Mac, Windows, or Linux.

To follow this tutorial on Linux, first install Docker Engine for your distribution.

Create a directory named learn-terraform-docker-container.

```bash
$ mkdir learn-terraform-docker-container
```

Then, navigate into it.

```bash
$ cd learn-terraform-docker-container
```

Paste the following Terraform configuration into a file and name it main.tf.

```file
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
```

Initialize the project, which downloads a plugin that allows Terraform to interact with Docker.

```bash
$ terraform init
```

Provision the NGINX server container with apply. When Terraform asks you to confirm type yes and press ENTER.

```bash
$ terraform apply
```

Verify the existence of the NGINX container by visiting localhost:8000 in your web browser or running docker ps to see the container.

To stop the container, run terraform destroy.

```bash
$ terraform destroy
```

You've now provisioned and destroyed an NGINX webserver with Terraform.


## Reference List {#reference-list}

1.  <https://learn.hashicorp.com/tutorials/terraform/install-cli>

