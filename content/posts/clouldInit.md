---
title: "Create Proxmox cloud-init template :cloud-init:Proxmox:"
date: 2021-12-03T18:27:00+08:00
categories: ["Cluster"]
draft: false
---

## Overview {#overview}

In this article, I'll demonstrate how to create a cloud-init enabled Ubuntu 20.04 LTS base image to use on Proxmox VE.


## Cloud Native Image {#cloud-native-image}

The tradition packer builder to build a base image from an ISO file. Modern Linux distributions are increasingly moving away from this install method and preseed files. Rather, disk images are provided with the OS pre-installed, and configuration is performed via cloud-init. We will create a Proxmox KVM base image using Ubuntu's KVM cloud image.


## Proxmox Script {#proxmox-script}

The Proxmox API doesn't appear to offer the full functionality provided by the native shell commands to create a template, so we will run a script via SSH or Proxmox node's GUI shell.

The Script you can found on my GitHub. There is the Link.

The below sections, I will explain this Script step by steps.


## Step 1: Download the image {#step-1-download-the-image}

We are downloading the kvm disk image.

**Note**: This is a qcow2 image format with an extension of .img, Promxox doesn't like this so we rename the disk image to .qcow2

```bash
SRC_IMG="https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
IMG_NAME="focal-server-cloudimg-amd64-disk-kvm.qcow2"
wget -O $IMG_NAME $SRC_IMG
```


## Step 2: Add QEMU Guest Agent {#step-2-add-qemu-guest-agent}

The Ubuntu 20.04 image we are going to use does not include the **qemu-guest-agent** package which is needed for the **Guest VM** to report its IP details back to Proxmox. This is required for Packer to communicate with the VM after cloning. The template. **libguestfs-tools** will allow us to embed qemu-guest-agent into the image. You can also add any additional packages you'd like in your base image. Personally, I prefer to customize this base image later with packer so that the packages can live in source control.

```bash
apt update
apt install -y libguestfs-tools
virt-customize --install qemu-guest-agent -a $IMG_NAME
```


## Step 3: Create a VM in Proxmox with required settings and convert to template {#step-3-create-a-vm-in-proxmox-with-required-settings-and-convert-to-template}

For best performance, virtio "hardware" should be used. Additionally, cloud-init requires a serial console and cloudinit IDE (CDROM) drive. We will set the network config to DHCP so that we get an IP address. Lastly, we will expand the template disk image size so we have space to install items later. It appears packer doesn't support doing this later.

```bash
TEMPL_NAME="ubuntu2004-cloud"
VMID="9000"
MEM="512"
DISK_SIZE="32G"
DISK_STOR="local-lvm"
NET_BRIDGE="vmbr0"
qm create $VMID --name $TEMPL_NAME --memory $MEM --net0 virtio,bridge=$NET_BRIDGE
qm importdisk $VMID $IMG_NAME $DISK_STOR
qm set $VMID --scsihw virtio-scsi-pci --scsi0 $DISK_STOR:vm-$VMID-disk-0
qm set $VMID --ide2 $DISK_STOR:cloudinit
qm set $VMID --boot c --bootdisk scsi0
qm set $VMID --serial0 socket --vga serial0
qm set $VMID --ipconfig0 ip=dhcp
qm resize $VMID scsi0 $DISK_SIZE
qm template $VMID
# Remove downloaded image
rm $IMG_NAME
```


## Step 4: Packer template {#step-4-packer-template}

Now that we have our cloud-init enabled image on Proxmox, we can use Packer to create a template based off of this template.
Ensure to set the scsi\_controller="virtio-scsi-pci" and qemu\_agent=true.

I'd recommend adding the Proxmox variables to a var file.

```bash
packer build --var-file=./proxmox.pkvars.hcl --var "proxox_template_name=test-output-template" --var "proxmox_source_template=ubuntu2004-cloud" base.pkr.hcl
```


## Final {#final}

Now that you've created a template using packer from the base template, you can use Terraform to deploy that VM!


## References {#references}

1.  <https://gist.github.com/chriswayg/43fbea910e024cbe608d7dcb12cb8466>
2.  <https://whattheserver.com/proxmox-cloud-init-os-template-creation/>
3.  <https://norocketscience.at/deploy-proxmox-virtual-machines-using-cloud-init/>
4.  <https://pve.proxmox.com/wiki/Cloud-Init%5FSupport>
5.  <https://blog.dustinrue.com/2020/05/going-deeper-with-proxmox-cloud-init/>
6.  <https://gist.github.com/mike1237/cce83a74f898b11c2cec911204568cf9>
