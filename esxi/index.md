# ESXi

## ESXi Installation
### Prerequisites
+ Linux machine with superuser access to it
+ USB flash drive that can be detected by the Linux machine
+ The ESXi ISO image, **VMware-VMvisor-Installer-version_number-build_number.x86_64.iso**, which includes the **isolinux.cfg** file
+ Syslinux package

### Procedure
1. Determine USB flash drive
(1). list disk using fdisk
```console
[yanboyang713@boyang ~]$ sudo fdisk -l
[sudo] password for yanboyang713: 
Disk /dev/nvme0n1: 465.76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: CT500P1SSD8                             
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 0B01F91F-D62C-6A4F-BDED-D81DB5D8A3F6

Device             Start       End   Sectors   Size Type
/dev/nvme0n1p1      4096    618495    614400   300M EFI System
/dev/nvme0n1p2    618496 940843216 940224721 448.3G Linux filesystem
/dev/nvme0n1p3 940843217 976768064  35924848  17.1G Linux swap
```

(2). Plug in your USB flash drive.
(3). list disk again
```console
[yanboyang713@boyang ~]$ sudo fdisk -l
Disk /dev/nvme0n1: 465.76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: CT500P1SSD8                             
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 0B01F91F-D62C-6A4F-BDED-D81DB5D8A3F6

Device             Start       End   Sectors   Size Type
/dev/nvme0n1p1      4096    618495    614400   300M EFI System
/dev/nvme0n1p2    618496 940843216 940224721 448.3G Linux filesystem
/dev/nvme0n1p3 940843217 976768064  35924848  17.1G Linux swap


Disk /dev/sda: 3.8 GiB, 4081057792 bytes, 7970816 sectors
Disk model: USB Flash Disk  
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x673666e2

Device     Boot Start     End Sectors  Size Id Type
/dev/sda1        2048 7970815 7968768  3.8G  b W95 FAT32
```

**NOTE:** As you can see your disk is ***/dev/sda***.

2. Create a partition table on the USB flash device.
```console
[yanboyang713@boyang ~]$ sudo fdisk /dev/sda

Welcome to fdisk (util-linux 2.36.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): 
```
a. Enter d to delete partitions until they are all deleted.
b. Enter n to create a primary partition 1 that extends over the entire disk.
c. Enter t to set the type to an appropriate setting for the FAT32 file system, such as c.
d. Enter a to set the active flag on partition 1.
e. Enter p to print the partition table.
f. Enter w to write the partition table and exit the program.

```console
[yanboyang713@boyang ~]$ sudo fdisk /dev/sda

Welcome to fdisk (util-linux 2.36.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): d
Selected partition 1
Partition 1 has been deleted.

Command (m for help): p
Disk /dev/sda: 3.8 GiB, 4081057792 bytes, 7970816 sectors
Disk model: USB Flash Disk  
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x673666e2

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 
First sector (2048-7970815, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-7970815, default 7970815): 

Created a new partition 1 of type 'Linux' and of size 3.8 GiB.
Partition #1 contains a vfat signature.

Do you want to remove the signature? [Y]es/[N]o: Y

The signature will be removed by a write command.

Command (m for help): p
Disk /dev/sda: 3.8 GiB, 4081057792 bytes, 7970816 sectors
Disk model: USB Flash Disk  
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x673666e2

Device     Boot Start     End Sectors  Size Id Type
/dev/sda1        2048 7970815 7968768  3.8G 83 Linux

Filesystem/RAID signature on partition 1 will be wiped.

Command (m for help): t
Selected partition 1
Hex code or alias (type L to list all): c
Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.

Command (m for help): a
Selected partition 1
The bootable flag on partition 1 is enabled now.

Command (m for help): p
Disk /dev/sda: 3.8 GiB, 4081057792 bytes, 7970816 sectors
Disk model: USB Flash Disk  
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x673666e2

Device     Boot Start     End Sectors  Size Id Type
/dev/sda1  *     2048 7970815 7968768  3.8G  c W95 FAT32 (LBA)

Filesystem/RAID signature on partition 1 will be wiped.

Command (m for help): w
The partition table has been altered.
Syncing disks.

[yanboyang713@boyang ~]$
```

3. Format the USB flash drive with the Fat32 file system.

```console
[yanboyang713@boyang ~]$ sudo mkfs.vfat -F 32 -n USB /dev/sda1
mkfs.fat 4.2 (2021-01-31)
```

On Linux run the command:
```console
[yanboyang713@boyang Downloads]$ sudo dd if=./VMware-VMvisor-Installer-7.0.0-15843807.x86_64.iso of=/dev/sda bs=500MB
0+1 records in
0+1 records out
367314944 bytes (367 MB, 350 MiB) copied, 96.6084 s, 3.8 MB/s
```

You can verify that the image was written correctly with md5sum. For Linux run the below commands and the 2 values generated by md5sum should match.

```console
[yanboyang713@boyang Downloads]$ md5sum ./VMware-VMvisor-Installer-7.0.0-15843807.x86_64.iso 
220d2e87290f50c3508214cadf66b737  ./VMware-VMvisor-Installer-7.0.0-15843807.x86_64.iso
[yanboyang713@boyang Downloads]$ ls -l VMware-VMvisor-Installer-7.0.0-15843807.x86_64.iso 
-rw-r--r-- 1 yanboyang713 yanboyang713 367314944 Apr 19 03:06 VMware-VMvisor-Installer-7.0.0-15843807.x86_64.iso
```

In the output of the ls command, you’ll see the size of the file. Use that in the following command (367314944 is the below example).

```console
[yanboyang713@boyang Downloads]$ dd if=/dev/sda bs=367314944 count=1 2> /dev/null | md5sum
d41d8cd98f00b204e9800998ecf8427e  -
```





