---
title: "Getting Started MikroTik Cloud Hosted Router (CHR) on Proxmox"
date: 2021-12-06T12:28:00+08:00
categories: ["Cluster"]
draft: false
---

## Introduction {#introduction}

Cloud Hosted Router (CHR) is a RouterOS version intended for running as a virtual machine. It supports the x86 64-bit architecture and can be used on most of the popular hypervisors such as VMWare, Hyper-V, VirtualBox, KVM and others. CHR has full RouterOS features enabled by default but has a different licensing model than other RouterOS versions.


## Prerequires {#prerequires}

1.  read [Cluster/Getting Started Set-up OVS for Proxmox]({{< relref "ProxmoxOVS" >}})


## System Minimal Requirements {#system-minimal-requirements}

-   Package version: RouterOS v6.34 or newer
-   Host CPU: 64-bit with virtualization support
-   RAM: 128MB or more
-   Disk: 128MB disk space for the CHR virtual hard drive (Max: 16GB)

**NOTE**: The minimum required RAM depends on interface count and CPU count. You can get an approximate number by using the following formula: RAM = 128 + [ 8 × (CPU\_COUNT) × (INTERFACE\_COUNT - 1) ]


## The CHR has 4 license levels: {#the-chr-has-4-license-levels}

-   free
-   **p1** perpetual-1 ($45)
-   **p10** perpetual-10 ($95)
-   **p-unlimited** perpetual-unlimited ($250)

Perpetual is a lifetime license (buy once, use forever). It is possible to transfer a perpetual license to another CHR instance. A running CHR instance will indicate the time when it has to access the account server to renew it's license. If the CHR instance will not be able to renew the license it will behave as if the trial period has ran out and will not allow an upgrade of RouterOS to a newer version.

After licensing a running trial system, you must manually run the **/system license renew** function from the CHR to make it active. Otherwise the system will not know you have licensed it in your account. If you do not do this before the system deadline time, the trial will end and you will have to do a complete fresh CHR installation, request a new trial and then license it with the license you had obtained.


### Paid licenses {#paid-licenses}


#### p1 {#p1}

p1 (perpetual-1) license level allows CHR to run indefinitely. It is limited to 1Gbps upload per interface. All the rest of the features provided by CHR are available without restrictions. It is possible to upgrade p1 to p10 or p-unlimited After the upgrade is purchased the former license will become available for later use on your account.


#### p10 {#p10}

p10 (perpetual-10) license level allows CHR to run indefinitely. It is limited to 10Gbps upload per interface. All the rest of the features provided by CHR are available without restrictions. It is possible to upgrade p10 to p-unlimited After the upgrade is purchased the former license will become available for later use on your account.


#### p-unlimited {#p-unlimited}

The p-unlimited (perpetual-unlimited) license level allows CHR to run indefinitely. It is the highest tier license and it has no enforced limitations.


#### Free licenses {#free-licenses}

The free license level allows CHR to run indefinitely. It is limited to 1Mbps upload per interface. All the rest of the features provided by CHR are available without restrictions. To use this, all you have to do is download disk image file from our download page and create a virtual guest.


## CHR ProxMox installation {#chr-proxmox-installation}


### Step 1: Registration a new mikrotik account, if you have NOT it. {#step-1-registration-a-new-mikrotik-account-if-you-have-not-it-dot}

<https://mikrotik.com/client>


### Step 2: Installation {#step-2-installation}

I recommand using the below Bash script to install. You need to **ssh** into your ProxMox and run below script.

Before run this script, Please do some research, which version of ROS you want to install. Please, check this [link](https://mikrotik.com/download).

What this script does:

-   Stores tmp files in: /root/temp dir.
-   Downloads raw image archive from MikroTik download page.
-   Converts image file to qcow format.
-   Creates basic VM that is attached to MGMT bridge.

**Important Note**: Make sure you have a MGMT bridge, which named **vmbr0**. If you have NOT  avaiable bridge, please have a look [Cluster/Getting Started Set-up OVS for Proxmox]({{< relref "ProxmoxOVS" >}})

```bash
#!/bin/bash

#vars
version="nil"
vmID="nil"

echo "############## Start of Script ##############

## Checking if temp dir is available..."
if [ -d /root/temp ]
then
    echo "-- Directory exists!"
else
    echo "-- Creating temp dir!"
    mkdir /root/temp
fi

# apt install unzip
echo "Install unzip"
apt update
apt install unzip -y

# Ask user for version
echo "## Preparing for image download and VM creation!"
read -p "Please input CHR version to deploy ( 6.49.1 (Stable) 6.49rc2 (Testing) 7.1 (Testing)):" version
# Check if image is available and download if needed
if [ -f /root/temp/chr-$version.img ]
then
    echo "-- CHR image is available."
else
    echo "-- Downloading CHR $version image file."
    cd  /root/temp
    echo "---------------------------------------------------------------------------"
    wget https://download.mikrotik.com/routeros/$version/chr-$version.img.zip
    unzip chr-$version.img.zip
    echo "---------------------------------------------------------------------------"
fi
# List already existing VM's and ask for vmID
echo "== Printing list of VM's on this hypervisor!"
qm list
echo ""
read -p "Please Enter free vm ID to use:" vmID
echo ""
# Create storage dir for VM if needed.
if [ -d /var/lib/vz/images/$vmID ]
then
    echo "-- VM Directory exists! Ideally try another vm ID!"
    read -p "Please Enter free vm ID to use:" vmID
else
    echo "-- Creating VM image dir!"
    mkdir /var/lib/vz/images/$vmID
fi
# Creating qcow2 image for CHR.
echo "-- Converting image to qcow2 format "
qemu-img convert \
    -f raw \
    -O qcow2 \
    /root/temp/chr-$version.img \
    /var/lib/vz/images/$vmID/vm-$vmID-disk-1.qcow2
# Creating VM
echo "-- Creating new CHR VM"
qm create $vmID \
  --name chr-$version \
  --net0 virtio,bridge=vmbr0 \
  --bootdisk virtio0 \
  --ostype l26 \
  --memory 256 \
  --onboot no \
  --sockets 1 \
  --cores 1 \
  --virtio0 local:$vmID/vm-$vmID-disk-1.qcow2

# remove downloaded raw image and zip
rm /root/temp/chr-$version.img.zip
rm /root/temp/chr-$version.img

echo "############## End of Script ##############"
```

**NOTE**: Useful snippet to clean up the BASH script from Windows formatting that may interfere with script if it's edited on a Windows workstation:

```console
sed -i -e 's/\r$//' *.sh
```