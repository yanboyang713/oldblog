# Getting Started OpenWrt


## Introduction {#introduction}

The OpenWrt Project is a Linux operating system targeting embedded devices. Instead of trying to create a single, static firmware, OpenWrt provides a fully writable filesystem with package management. This frees you from the application selection and configuration provided by the vendor and allows you to customize the device through the use of packages to suit any application.

OpenWrt official Website [Here](https://openwrt.org/).

In this article, I will talk about:

1.  Compile Openwrt from Source Code.
2.  Install Openwrt on ProxMox.
3.  Basic Set-Up for Openwrt.


## Compile OpenWrt {#compile-openwrt}

1.  Make sure your have a avaiable Linux/MacOS system, offers recommand Ubuntu 18 LTS x64.
2.  Install required packages.

    ```bash
       sudo apt-get update

       sudo apt-get -y install build-essential asciidoc binutils bzip2 curl gawk gettext git libncurses5-dev libz-dev patch python3.5 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf
    ```
3.  Getting Source Code and enter direction.

    ```bash
       git clone -b main --single-branch https://github.com/Lienol/openwrt openwrt
       cd openwrt
    ```
4.  Add additional package/plugin to Source Code, such as **Passwall**.

    ```bash
       vim feeds.conf.default
    ```

    Adding src-git at the end of file.

    ```file
       src-git passwall https://github.com/xiaorouji/openwrt-passwall
    ```
5.  Update the feeds

    ```bash
       ./scripts/feeds clean
       ./scripts/feeds update -a
       ./scripts/feeds install -a
    ```
6.  Configure the firmware image

    ```bash
       make menuconfig
    ```

    **NOTE**:

    1.  First three menu is very inportance, Please, carefully choose with your correct CPU architecture. For example, x86.

    2.  Settings your package/plugins luci-app, such as, luci-app-passwall

7.  Downloading DL library.

    ```bash
       make -j8 download v=s
    ```
8.  Start Compile

    ```bash
       make -j1 V=s
    ```

    **NOTE**: -j1 is followed by the number of threads. Single thread is recommended for the first compilation.
9.  Output path after compilation.
    **openwrt/bin/targets**


## Installation {#installation}

<https://www.77bx.com/34.html>


### Firstly, Upload your compiled IMG File to ProxMox {#firstly-upload-your-compiled-img-file-to-proxmox}

sftp into ProxMox.

```console
[yanboyang713@manjaro] ➜ 64 (U main) sftp root@192.168.1.2
The authenticity of host '192.168.1.2 (192.168.1.2)' can't be established.
ED25519 key fingerprint is SHA256:VPD220yr70tQsDuIn/z41hTWzte0bZ1k6wF8JjBzjiw.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.1.2' (ED25519) to the list of known hosts.
root@192.168.1.2's password:
Connected to 192.168.1.2.
```

Uploading

```bash
sftp> put openwrt-x86-64-generic-squashfs-combined.img.gz
Uploading openwrt-x86-64-generic-squashfs-combined.img.gz to /root/openwrt-x86-64-generic-squashfs-combined.img.gz
openwrt-x86-64-generic-squashfs-combined.img.gz                                                          100%   53MB 111.4MB/s   00:00
sftp>
```

**NOTE**:

1.  List local directory.

    ```console
       sftp> lls
       openwrt-x86-64-generic-squashfs-combined.img.gz
    ```
2.  List remote directory.

    ```console
       sftp> ls
       ROSinstall.sh  interfaces     temp
    ```


### Secondly, ssh into ProxMox and using the below Script create a new VM. {#secondly-ssh-into-proxmox-and-using-the-below-script-create-a-new-vm-dot}

```bash
#!/bin/bash

#vars
vmID="nil"

echo "############## Start of Script ##############

#List already existing VM's and ask for vmID

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


# Creating VM
echo "-- Creating new CHR VM"
qm create $vmID \
  --name chr-$version \
  --net0 virtio,bridge=vmbr0 \
  --bootdisk virtio0 \
  --ostype l26 \
  --memory 2048 \
  --onboot no \
  --sockets 1 \
  --cores 1 \
  --virtio0 local-lvm:vm-$vmID-disk-0

# Decompression image
gzip -d /root/openwrt-x86-64-generic-squashfs-combined.img.gz

# Resize image
qemu-img resize /root/openwrt-x86-64-generic-squashfs-combined.img +10G

echo "-- Import RAW image to local-lvm"
qm importdisk $vmID /root/openwrt-x86-64-generic-squashfs-combined.img local-lvm

echo "############## End of Script ##############"
```


## Set-up {#set-up}

1.  Change Password

    ```bash
       passwd
    ```
2.  Set **Lan** IP Address, Gateway and DNS

network -> interface -> edit

Content need to set-up:

-   General Settings:

IPv4 IP Address: 192.168.1.252
IPv4 gateway: 192.168.1.253
IPv4 bradcast: 192.168.1.0

-   Advantages Settings:

DNS set as public DNS Server: 114.114.114.114, 114,114,115,115

1.  If this Openwrt as your bypass router, please follow at the below settings.
    **LAN Settings**: Let lede only be used as a pure bypass route, DHCP and IPv6 are both allocated by the main route.
    -   DHCP Server -> General Settings -> choose Ignore this interface.
    -   IPv6 Settings -> RA Service - Disable
    -   IPv6 Settings -> DHCPv6 Service - Disable

2.  Let lede obtain IPv6 information normally.

add new interface -> name: IPv6; Protocol: DHCPv6 Client Device: @lan -> create interface -> Firewall settings: lan -> create interface.

