---
title: "Get Started with Proxmox"
date: 2020-02-03T06:11:32+10:00
tags: [ "QEMU", "KVM", "LXC" ]
categories: [ "virtual environment" ]
---
## Introduction
Proxmox Virtual Environment is an open source server virtualization management solution based on QEMU/KVM and LXC. Proxmox VE is based on Debian. You can manage virtual machines, containers, highly available clusters, storage and networks with an integrated, easy-to-use web interface or via CLI.

## Install
I recommend you use USB Flash Drive as Installation Medium because it is the faster option.
### Download the installer ISO image
You can download ISO image from: https://www.proxmox.com/en/downloads/category/iso-images-pve
Currently, the latest version is 6.3-1.

### Prepare a USB Flash Drive as Installation Medium
Official link: https://pve.proxmox.com/wiki/Prepare_Installation_Media

#### Linux

##### Find the Correct USB Device Name
There are two ways to find out the name of the USB flash drive. The first one is use **lsblk** (strong recommend). The second way is to compare the output of the *fdisk -l* command. Both example at the below.

```console
boyang:~$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0         7:0    0 290.4M  1 loop /snap/vlc/1700
loop1         7:1    0   956K  1 loop /snap/gnome-logs/100
loop2         7:2    0  55.4M  1 loop /snap/core18/1932
loop3         7:3    0 156.4M  1 loop /snap/ramboxpro/22
loop4         7:4    0 204.4M  1 loop /snap/microk8s/1668
loop5         7:5    0   956K  1 loop /snap/gnome-logs/81
loop6         7:6    0  64.8M  1 loop /snap/gtk-common-themes/1514
loop7         7:7    0 161.4M  1 loop /snap/gnome-3-28-1804/128
loop8         7:8    0   2.2M  1 loop /snap/gnome-system-monitor/148
loop9         7:9    0   2.4M  1 loop /snap/gnome-calculator/748
loop10        7:10   0 217.9M  1 loop /snap/gnome-3-34-1804/60
loop11        7:11   0   276K  1 loop /snap/gnome-characters/570
loop12        7:12   0   2.5M  1 loop /snap/gnome-calculator/826
loop13        7:13   0 162.9M  1 loop /snap/gnome-3-28-1804/145
loop14        7:14   0   4.2M  1 loop /snap/tree/18
loop15        7:15   0   3.7M  1 loop /snap/gnome-system-monitor/127
loop16        7:16   0   276K  1 loop /snap/gnome-characters/550
loop17        7:17   0  97.8M  1 loop /snap/core/10185
loop18        7:18   0 255.6M  1 loop /snap/gnome-3-34-1804/36
loop19        7:19   0  64.4M  1 loop /snap/gtk-common-themes/1513
loop20        7:20   0  97.9M  1 loop /snap/core/10444
loop21        7:21   0 204.4M  1 loop /snap/microk8s/1786
loop22        7:22   0  55.3M  1 loop /snap/core18/1885
loop23        7:23   0 228.1M  1 loop /snap/netease-music/2
sda           8:0    1   3.8G  0 disk 
├─sda1        8:1    1   242K  0 part 
├─sda2        8:2    1   2.8M  0 part 
├─sda3        8:3    1 859.2M  0 part /media/yanboyang713/PVE1
└─sda4        8:4    1   300K  0 part 
nvme0n1     259:0    0 465.8G  0 disk 
├─nvme0n1p1 259:1    0   512M  0 part /boot/efi
└─nvme0n1p2 259:2    0 465.3G  0 part /
```

OR

```console
boyang:~$ sudo fdisk -l
[sudo] password for yanboyang713: 
Disk /dev/loop0: 290.4 MiB, 304545792 bytes, 594816 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 956 KiB, 978944 bytes, 1912 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 55.4 MiB, 58052608 bytes, 113384 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop3: 156.4 MiB, 164028416 bytes, 320368 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop4: 204.4 MiB, 214278144 bytes, 418512 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop5: 956 KiB, 978944 bytes, 1912 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop6: 64.8 MiB, 67915776 bytes, 132648 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop7: 161.4 MiB, 169254912 bytes, 330576 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/nvme0n1: 465.8 GiB, 500107862016 bytes, 976773168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: C60CB535-938E-4A9F-9BAC-92FDE1DD99B0

Device           Start       End   Sectors   Size Type
/dev/nvme0n1p1    2048   1050623   1048576   512M EFI System
/dev/nvme0n1p2 1050624 976771071 975720448 465.3G Linux filesystem


Disk /dev/loop8: 2.2 MiB, 2273280 bytes, 4440 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop9: 2.4 MiB, 2555904 bytes, 4992 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop10: 217.9 MiB, 228478976 bytes, 446248 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop11: 276 KiB, 282624 bytes, 552 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop12: 2.5 MiB, 2600960 bytes, 5080 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop13: 162.9 MiB, 170778624 bytes, 333552 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop14: 4.2 MiB, 4448256 bytes, 8688 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop15: 3.7 MiB, 3825664 bytes, 7472 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop16: 276 KiB, 282624 bytes, 552 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop17: 97.8 MiB, 102486016 bytes, 200168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop18: 255.6 MiB, 267980800 bytes, 523400 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop19: 64.4 MiB, 67477504 bytes, 131792 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop20: 97.9 MiB, 102612992 bytes, 200416 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop21: 204.4 MiB, 214319104 bytes, 418592 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop22: 55.3 MiB, 58007552 bytes, 113296 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop23: 228.1 MiB, 239149056 bytes, 467088 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sda: 3.8 GiB, 4081057792 bytes, 7970816 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 50FC8F62-2C89-43B6-8D1F-C8D3CC3F8B72

Device       Start     End Sectors   Size Type
/dev/sda1       64     547     484   242K Microsoft basic data
/dev/sda2      548    6307    5760   2.8M EFI System
/dev/sda3     6308 1765843 1759536 859.2M Apple HFS/HFS+
/dev/sda4  1765844 1766443     600   300K Microsoft basic data
```

##### Make a bootable USB using DD
On Unix-like operating system use the dd command to copy the ISO image to the USB flash drive. First find the correct device name of the USB flash drive (see above). Then run the dd command.

```console
boyang:~$ sudo dd bs=1M conv=fdatasync if=~/Downloads/proxmox-ve_6.3-1.iso of=/dev/sda
812+1 records in
812+1 records out
852299776 bytes (852 MB, 813 MiB) copied, 185.781 s, 4.6 MB/s
```

### Start Installion
Office Website: https://pve.proxmox.com/wiki/Installation
#### Step 1:
When you boot from USB, You will see the below image.
![](https://pve.proxmox.com/pve-docs/images/screenshot/pve-grub-menu.png)

+ Install Proxmox VE
Starts the normal installation. 
**NOTE:** It’s possible to use the installation wizard with a keyboard only. Buttons can be clicked by pressing the ALT key combined with the underlined character from the respective button. For example, ALT + N to press a Next button.

+ Install Proxmox VE (Debug mode)
Starts the installation in debug mode. A console will be opened at several installation steps. This helps to debug the situation if something goes wrong. To exit a debug console, press CTRL-D. This option can be used to boot a live system with all basic tools available. You can use it, for example, to repair a degraded ZFS rpool or fix the bootloader for an existing Proxmox VE setup.

+ Rescue Boot
With this option you can boot an existing installation. It searches all attached hard disks. If it finds an existing installation, it boots directly into that disk using the Linux kernel from the ISO. This can be useful if there are problems with the boot block (grub) or the BIOS is unable to read the boot block from the disk.

+ Test Memory
Runs memtest86+. This is useful to check if the memory is functional and free of errors.

After selecting Install Proxmox VE and accepting the EULA, the prompt to select the target hard disk(s) will appear. The Options button opens the dialog to select the target file system.

The default file system is ext4. The Logical Volume Manager (LVM) is used when ext4 or xfs is selected. Additional options to restrict LVM space can be set (see below).

Proxmox VE can be installed on ZFS. As ZFS offers several software RAID levels, this is an option for systems that don’t have a hardware RAID controller. The target disks must be selected in the Options dialog. More ZFS specific settings can be changed under Advanced Options.

I choose Install Proxmox VE for new install.

#### Step 2:
![](https://pve.proxmox.com/pve-docs/images/screenshot/pve-select-location.png)
The next page asks for basic configuration options like the location, the time zone, and keyboard layout. The location is used to select a download server close by to speed up updates. The installer usually auto-detects these settings. They only need to be changed in the rare case that auto detection fails or a different keyboard layout should be used.

#### Step 3:
![](https://pve.proxmox.com/pve-docs/images/screenshot/pve-set-password.png)
Next the password of the superuser (root) and an email address needs to be specified. The password must consist of at least 5 characters. It’s highly recommended to use a stronger password. Some guidelines are:

+ Use a minimum password length of 12 to 14 characters.

+ Include lowercase and uppercase alphabetic characters, numbers, and symbols.

+ Avoid character repetition, keyboard patterns, common dictionary words, letter or number sequences, usernames, relative or pet names, romantic links (current or past), and biographical information (for example ID numbers, ancestors' names or dates).

The email address is used to send notifications to the system administrator. For example:

+ Information about available package updates.

+ Error messages from periodic CRON jobs.
#### Step 4:
![](https://pve.proxmox.com/pve-docs/images/screenshot/pve-setup-network.png)
The last step is the network configuration. Please note that during installation you can either use an IPv4 or IPv6 address, but not both. To configure a dual stack node, add additional IP addresses after the installation.
#### Step 5:
![](https://pve.proxmox.com/pve-docs/images/screenshot/pve-install-summary.png)
The next step shows a summary of the previously selected options. Re-check every setting and use the Previous button if a setting needs to be changed. To accept, press Install. The installation starts to format disks and copies packages to the target. Please wait until this step has finished; then remove the installation medium and restart your system.

![](https://pve.proxmox.com/pve-docs/images/screenshot/pve-installation.png)

If the installation failed check out specific errors on the second TTY (‘CTRL + ALT + F2’), ensure that the systems meets the minimum requirements. If the installation is still not working look at the how to get help chapter.

Further configuration is done via the Proxmox web interface. Point your browser to the IP address given during installation (https://youripaddress:8006).

#### Advanced LVM Configuration Options
The installer creates a Volume Group (VG) called pve, and additional Logical Volumes (LVs) called root, data, and swap. To control the size of these volumes use:
+ hdsize
Defines the total hard disk size to be used. This way you can reserve free space on the hard disk for further partitioning (for example for an additional PV and VG on the same hard disk that can be used for LVM storage).
+ swapsize
Defines the size of the swap volume. The default is the size of the installed memory, minimum 4 GB and maximum 8 GB. The resulting value cannot be greater than hdsize/8.

**NOTE:** If set to 0, no swap volume will be created.
+ maxroot
Defines the maximum size of the root volume, which stores the operation system. The maximum limit of the root volume size is hdsize/4.
+ maxvz
 Defines the maximum size of the data volume. The actual size of the data volume is:

***datasize = hdsize - rootsize - swapsize - minfree***

Where datasize cannot be bigger than maxvz.

**NOTE:** In case of LVM thin, the data pool will only be created if datasize is bigger than 4GB.
**NOTE:** If set to 0, no data volume will be created and the storage configuration will be adapted accordingly.

+ minfree
Defines the amount of free space left in the LVM volume group pve. With more than 128GB storage available the default is 16GB, else hdsize/8 will be used.
**NOTE:** LVM requires free space in the VG for snapshot creation (not required for lvmthin snapshots).


https://linuxhint.com/zfs_vs_xfs/

https://www.salvagedata.com/btrfs-zfs-xfs-ext4-how-are-they-different/

## How to update Proxmox without buying a subscription
On the Proxmox website, they say: “Proxmox VE is a complete open-source platform for enterprise virtualization.” And typically you can’t charge for open source software; but the folks at Proxmox have done their best to scare most of us into buying a subscription — or, at least, to make us feel guilty for not having one.

Now, Proxmox is great software; and developing great software takes great resources, great developers… and great money. As such, I encourage you to purchase a subscription if you’re using Proxmox in a business environment. However, some of you may be interested in using it for home usage, or just to tinker around, and for any of a variety of reasons you may not wish to, or may not be able to, purchase a subscription. This section is for you.

To be clear, Proxmox works just fine without a license. The non-licensed version is just as functional as the paid version, with one exception: it doesn’t have access to the tested “enterprise” update repositories. As such (without the changes I’m about to show you), you can’t update the Debian software. Oh and of course, there’s that little nag screen each time you log in.

SSH into the Proxmox host, or access its console through the web interface, and make a copy of the pve-enterprise.list sources file, like so:

1. Step 1:
```bash
root@pve ~# cd /etc/apt/sources.list.d/
```
2. Step 2:
```bash
root@pve ~# cp pve-enterprise.list pve-no-subscription.list
```
3. Step 3:
OK, so now we have a copy of the original file. If we ever purchase a subscription later and want to use the enterprise repositories, we’ll be able to revert what we’ve done very easily. For now, edit the original file and comment out its one line; save and close the file.

4. Step 4:
Open the copied file, pve-no-subscription.list, and change the line ever so slightly. The original line looks something like this:

deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise

The parts to note are https (change it to http,) enterprise.proxmox.com (change enterprise to download), and the end of the string — pve-enterprise (change to pve-no-subscription ). Do not edit the word stretch or buster, or any other word that appears in that position; that’s the Debian version code name. Your edited line should look like this:

deb http://download.proxmox.com/debian/pve buster pve-no-subscription

Save and close the file. Now, update the package lists:
5. Step 5:
```bash
root@pve ~# apt-get update
```

6. Step 6: And when that’s done, run software upgrades!
```bash
root@pve ~# apt-get dist-upgrade
```
**Note:** Always run dist-upgrade, not just “apt-get upgrade.” Dist-upgrade ensures that all packages and their dependencies are updated; if you just run “apt-get upgrade” things may break.

## Renaming a PVE node
https://pve.proxmox.com/wiki/Renaming_a_PVE_node

/etc/hosts
```
127.0.0.1 localhost.localdomain localhost
10.172.14.61 pve.richie.corp.microsoft.com richie

## The following lines are desirable for IPv6 capable hosts

::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
```
/etc/hostname
```
richie
```

## Backup

