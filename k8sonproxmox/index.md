# Build a Kubernetes cluster on Proxmox via Ansible and Terraform


{{< figure src="https://miro.medium.com/max/1400/1*jL6SE1nSaPQb4EOWGnbZpw.jpeg" >}}


## Overview {#overview}

Proxmox is an open-source hypervisor that have enterprise capabilities and a large community behind it.

For Terraform and Ansible, i always like the idea of infrastructure as code (iac) and Terraform and Ansible just make it easy to accomplish.

The idea here was to be able to spin up a k3s cluster with minimum effort so i can spin it up and down for ever project that i would like to run.


## Prerequires {#prerequires}

1.  read [DevOps/Terraform Beginner's Guide]({{< relref "terraform" >}})
2.  read [DevOps/Ansible Beginner's Guide]({{< relref "ansible" >}})


## System requirements {#system-requirements}

-   The deployment environment must have [Ansible](https://docs.ansible.com/ansible/latest/installation%5Fguide/intro%5Finstallation.html) 2.4.0+
-   [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed
-   [Proxmox](https://www.proxmox.com/en/proxmox-ve) server


## Proxmox setup {#proxmox-setup}

