---
title: "Build a Kubernetes cluster on Proxmox via Ansible and Terraform"
date: 2021-12-01T20:27:00+08:00
tags: ["k8s", "proxmox", "ansible", "terraform"]
categories: ["Cluster"]
draft: false
---

{{< figure src="https://miro.medium.com/max/1400/1*jL6SE1nSaPQb4EOWGnbZpw.jpeg" >}}


## Overview {#overview}

Proxmox is an open-source hypervisor that have enterprise capabilities and a large community behind it.

For Terraform and Ansible, I always like the idea of infrastructure as code (iac) and Terraform and Ansible just make it easy to accomplish.

The idea here was to be able to spin up a k3s cluster with minimum effort so I can spin it up and down for ever project that I would like to run.


## Prerequires {#prerequires}

1.  read [DevOps/Terraform Beginner's Guide]({{< relref "terraform" >}})
2.  read [DevOps/Ansible Beginner's Guide]({{< relref "ansible" >}})
3.  read [Cluster/Create Proxmox cloud-init template]({{< relref "clouldInit" >}})


## System requirements {#system-requirements}

-   The deployment environment must have [Ansible](https://docs.ansible.com/ansible/latest/installation%5Fguide/intro%5Finstallation.html) 2.4.0+
-   [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed
-   [Proxmox](https://www.proxmox.com/en/proxmox-ve) server


## Step 1: Create Cloud-init VM template {#step-1-create-cloud-init-vm-template}

Please, following the step by step document on [Cluster/Create Proxmox cloud-init template]({{< relref "clouldInit" >}})


## Step 2: Generating public/private key pair {#step-2-generating-public-private-key-pair}

```bash
ssh-keygen -t rsa -f ~/.ssh/k3s
# Print Public Key
cat /root/.ssh/k3s.pub
```


## Step 3: Add public key, User name and Password to template {#step-3-add-public-key-user-name-and-password-to-template}

This is a example below:
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1639731593/PVE/pve-cloud-init%5Fef96tq.png)

When you done, click **Regenerate Image**.


## Step 2: terraform setup {#step-2-terraform-setup}

Clone the repo to get all the files and cd into the folder.

```bash
git clone https://github.com/NatiSayada/k3s-proxmox-terraform-ansible
cd k3s-proxmox-terraform-ansible
```

Our terraform also creates a dynamic host file for Ansible, so we need to create the files first.

```bash
cp -R inventory/sample inventory/my-cluster
```

Rename the file terraform/vars.sample to terraform/vars.tf and update all the vars. there you can select how many nodes would you like to have on your cluster and configure the name of the base image.

```text

```

to run the Terrafom, you will need to cd into terraform and run:

```bash
terraform init
terraform plan
terraform apply
```

It can take some time to create the servers on Proxmox but you can monitor them over Proxmox. it should look like this now:

Add alt text
<https://miro.medium.com/max/432/0*vnMepxEQgFND4dOw>


## Step 3: Ansible setup {#step-3-ansible-setup}

First, update the var file in inventory/my-cluster/group\_vars/all.yml and update the user name that you’re selected in the cloud-init setup.
after you run the Terrafom file, your host file should look like this:

```yml
[master]
192.168.3.200 Ansible_ssh_private_key_file=~/.ssh/proxk3s
[node]
192.168.3.202 Ansible_ssh_private_key_file=~/.ssh/proxk3s
192.168.3.201 Ansible_ssh_private_key_file=~/.ssh/proxk3s
192.168.3.198 Ansible_ssh_private_key_file=~/.ssh/proxk3s
192.168.3.203 Ansible_ssh_private_key_file=~/.ssh/proxk3s
[k3s_cluster:children]
master
node
```

Start provisioning of the cluster using the following command:

```bash
Ansible-playbook site.yml -i inventory/my-cluster/hosts.ini
```

this playbook will install k3s in 644 mode and helm.
the 644 mode is the permission needed for the /etc/rancher/k3s/k3s.yaml config file so it can be imported to rancher. so if you would also like to check out rancher.. you are good to go!


## Step 4: Kubeconfig {#step-4-kubeconfig}

To get access to your Kubernetes cluster just copy the k3s yaml file to your kube config file and change the ip address of the server

```bash
scp debian@master_ip:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

run kubectl get nodes to check you cluster nodes status
![](https://miro.medium.com/max/636/1*JgAE4EKXnCL-bEp7p0kOkg.png)


## Summary {#summary}

Now you should have a full blown k3s cluster running on Proxmox! all you have left is to start running some deployments.


## References {#references}

1.  <https://medium.com/@ssnetanel/build-a-kubernetes-cluster-using-k3s-on-proxmox-via-ansible-and-terraform-c97c7974d4a5>
