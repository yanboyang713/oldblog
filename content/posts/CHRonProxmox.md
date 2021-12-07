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
2.  read [Cluster/Proxmox PCI Passthrough]({{< relref "ProxmoxPassthrough" >}})


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
# import image
echo "-- Import RAW image to local-lvm"
qemu-img resize /root/temp/chr-$version.img +10G

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
  --virtio0 local-lvm:vm-$vmID-disk-0

qm importdisk $vmID /root/temp/chr-$version.img local-lvm

# remove downloaded raw image and zip
rm /root/temp/chr-$version.img.zip
rm /root/temp/chr-$version.img

echo "############## End of Script ##############"
```

**NOTE**: ERROR: storage 'local' does not support content-type 'images'
**NOTE**: Useful snippet to clean up the BASH script from Windows formatting that may interfere with script if it's edited on a Windows workstation:

```console
sed -i -e 's/\r$//' *.sh
```


### Step 3: Add WAN port to ROS {#step-3-add-wan-port-to-ros}

I am add a passthrough NIC as WAM, so before you read this section. Please, read [Cluster/Proxmox PCI Passthrough]({{< relref "ProxmoxPassthrough" >}}) first.

When you **DONE** set-up passthrough, now lets we list network interfaces name with PCI ID and add WAN.


#### List network interface name with PCI ID {#list-network-interface-name-with-pci-id}

```bash
apt install lshw
lshw -class network
```

For example, you can found interface name with bus id at below.

```file
*-network
       description: Ethernet interface
       product: I211 Gigabit Network Connection
       vendor: Intel Corporation
       physical id: 0
       bus info: pci@0000:04:00.0
       logical name: ens9
       version: 03
       serial: 00:90:27:e5:8d:07
       size: 1Gbit/s
       capacity: 1Gbit/s
       width: 32 bits
       clock: 33MHz
       capabilities: pm msi msix pciexpress bus_master cap_list ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
       configuration: autonegotiation=on broadcast=yes driver=igb driverversion=5.13.19-1-pve duplex=full firmware=0. 6-1 latency=0 link=yes multicast=yes port=twisted pair speed=1Gbit/s
       resources: irq:17 memory:df200000-df21ffff ioport:b000(size=32) memory:df220000-df223fff
```


#### Add WAN {#add-wan}

now lets we add WAN to ROS.

Go to **Hardware** Section -> **Add** -> **PCI Device**

Choose your WAN need to add in.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1638780489/PVE/hardwareAdd%5Faqh8vq.png" >}}


### Step 4: Start your ROS {#step-4-start-your-ros}
