---
title: "linux basic commands and common tools"
date: 2020-09-06T06:11:32+10:00
tags: [ "Linux command" ]
categories: [ "Linux" ]
---
## Hardware Information
There are plenty of commands to check information about the hardware of Linux system. Some commands report only specific hardware components like CPU or memory while the rest cover multiple hardware units. This section will look at some of the most commonly used commands to check information and configuration details about various hardware peripherals and devices.

The list includes lscpu, hwinfo, lshw, dmidecode, lspci etc.

### lscpu
The lscpu command reports information about the cpu and processing units. It does not have any further options or functionality.

``` console
$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  1
Core(s) per socket:  8
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               158
Model name:          Intel(R) Core(TM) i7-9700F CPU @ 3.00GHz
Stepping:            13
CPU MHz:             3710.930
CPU max MHz:         4700.0000
CPU min MHz:         800.0000
BogoMIPS:            6000.00
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            12288K
NUMA node0 CPU(s):   0-7
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault invpcid_single ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d arch_capabilities

```

### lshw - List Hardware
A general purpose utility, that reports detailed and brief information about multiple different hardware units such as cpu, memory, disk, usb controllers, network adapters etc. Lshw extracts the information from different /proc files.

#### Display Full Information
Running lshw without any options would generate full information report about all detected hardware. It would generate a big output with quite a lot of technical details.

``` bash
sudo lshw
```
#### Display information in short
With the "-short" the lshw command would generate a brief information report about the hardware devices that would quickly give an idea about the hardware profile of the system.

``` console
yanboyang713@boyang$ sudo lshw -short
H/W path         Device    Class          Description
=====================================================
                           system         MS-7C22 (Default string)
/0                         bus            Z390 PLUS (MS-7C22)
/0/0                       memory         64KiB BIOS
/0/39                      memory         16GiB System Memory
/0/39/0                    memory         [empty]
/0/39/1                    memory         8GiB DIMM DDR4 Synchronous 2667 MHz (0.4 ns)
/0/39/2                    memory         [empty]
/0/39/3                    memory         8GiB DIMM DDR4 Synchronous 2667 MHz (0.4 ns)
/0/43                      memory         512KiB L1 cache
/0/44                      memory         2MiB L2 cache
/0/45                      memory         12MiB L3 cache
/0/46                      processor      Intel(R) Core(TM) i7-9700F CPU @ 3.00GHz
/0/100                     bridge         Intel Corporation
/0/100/1                   bridge         Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Cont
/0/100/1/0                 display        NVIDIA Corporation
/0/100/1/0.1               multimedia     NVIDIA Corporation
/0/100/1/0.2               bus            NVIDIA Corporation
/0/100/1/0.2/0   usb3      bus            xHCI Host Controller
/0/100/1/0.2/1   usb4      bus            xHCI Host Controller
/0/100/1/0.3               bus            NVIDIA Corporation
/0/100/8                   generic        Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th Gen Core Processo
/0/100/12                  generic        Cannon Lake PCH Thermal Controller
/0/100/14                  bus            Cannon Lake PCH USB 3.1 xHCI Host Controller
/0/100/14/0      usb1      bus            xHCI Host Controller
/0/100/14/0/2              input          HP Basic USB Keyboard
/0/100/14/0/8              input          2.4G Mouse
/0/100/14/1      usb2      bus            xHCI Host Controller
/0/100/14.2                memory         RAM memory
/0/100/16                  communication  Cannon Lake PCH HECI Controller
/0/100/17                  storage        Cannon Lake PCH SATA AHCI Controller
/0/100/1b                  bridge         Intel Corporation
/0/100/1b.4                bridge         Cannon Lake PCH PCI Express Root Port 21
/0/100/1b.4/0    enp3s0f0  network        I350 Gigabit Network Connection
/0/100/1b.4/0.1  enp3s0f1  network        I350 Gigabit Network Connection
/0/100/1b.4/0.2  enp3s0f2  network        I350 Gigabit Network Connection
/0/100/1b.4/0.3  enp3s0f3  network        I350 Gigabit Network Connection
/0/100/1c                  bridge         Intel Corporation
/0/100/1c.4                bridge         Intel Corporation
/0/100/1c.4/0    enp5s0    network        RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
/0/100/1d                  bridge         Cannon Lake PCH PCI Express Root Port 9
/0/100/1d/0                storage        Micron/Crucial Technology
/0/100/1f                  bridge         Intel Corporation
/0/100/1f.3                multimedia     Cannon Lake PCH cAVS
/0/100/1f.4                bus            Cannon Lake PCH SMBus Controller
/0/100/1f.5                bus            Cannon Lake PCH SPI Controller
/1                         power          To Be Filled By O.E.M.
/2               docker0   network        Ethernet interface
/3               br0       network        Ethernet interface
```
#### Display only memory information
To display information about the memory, specify the memory class.

``` console
yanboyang713@boyang $ sudo lshw -short -class memory
H/W path         Device    Class          Description
=====================================================
/0/0                       memory         64KiB BIOS
/0/39                      memory         16GiB System Memory
/0/39/0                    memory         [empty]
/0/39/1                    memory         8GiB DIMM DDR4 Synchronous 2667 MHz (0.4 ns)
/0/39/2                    memory         [empty]
/0/39/3                    memory         8GiB DIMM DDR4 Synchronous 2667 MHz (0.4 ns)
/0/43                      memory         512KiB L1 cache
/0/44                      memory         2MiB L2 cache
/0/45                      memory         12MiB L3 cache
/0/100/14.2                memory         RAM memory
```

#### Display processor information
With class processor, lshw would display information about the cpu. It is better to not use the short option and get full details about the processor.

``` console
yanboyang713@boyang$ sudo lshw -class processor
  *-cpu                     
       description: CPU
       product: Intel(R) Core(TM) i7-9700F CPU @ 3.00GHz
       vendor: Intel Corp.
       physical id: 46
       bus info: cpu@0
       version: Intel(R) Core(TM) i7-9700F CPU @ 3.00GHz
       serial: To Be Filled By O.E.M.
       slot: U3E1
       size: 4631MHz
       capacity: 4700MHz
       width: 64 bits
       clock: 100MHz
       capabilities: x86-64 fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault invpcid_single ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d arch_capabilities cpufreq
       configuration: cores=8 enabledcores=8 threads=8
```

It should be noted that lshw does not accurately tell about the number of cores or processing units available. The above system for example is a quadcore processor with 4 processing units. Another command called lscpu gives more accurate information about the cpu.

#### Disk drives
Display the disk drives with the disk class.

``` bash
sudo lshw -short -class disk
```

To display information about the partitions and controllers also, specify the storage and volume class along with the disk class. Then it would give a more clear picture about the storage on the system.

```bash
sudo lshw -short -class disk -class storage -class volume
```
#### Network adapter information
Use the network class to display information about the network adapter/interface. Omitting the short option is a good idea to get detailed information about it.

``` bash
sudo lshw -class network
```
The value of the "serial" field is same as the MAC address. The configuration field indicates that autonegotiation is turned on and the current operating speed is 100Mbit/s. These configurations can be modified with the ethtool command.

#### Display address details with businfo

With the businfo option lshw would output the address details of pci, usb, scsi and ide devices.

```bash
sudo lshw -businfo
```
The output is similar to "short" option, with the first column replaced with Bus Info.

#### Generate report in html/xml format
Lshw is capable of producing reports in html, xml and json formats.
```bash
$ sudo lshw -html > hardware.html
```

For xml format
```bash
$ sudo lshw -xml > hardware.xml
```

### lspci - List PCI
The lspci command lists out all the pci buses and details about the devices connected to them.
The vga adapter, graphics card, network adapter, usb ports, sata controllers, etc all fall under this category.

``` console
yanboyang713@boyang$ lspci
00:00.0 Host bridge: Intel Corporation Device 3e30 (rev 0d)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16) (rev 0d)
00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th Gen Core Processor Gaussian Mixture Model
00:12.0 Signal processing controller: Intel Corporation Cannon Lake PCH Thermal Controller (rev 10)
00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller (rev 10)
00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
00:16.0 Communication controller: Intel Corporation Cannon Lake PCH HECI Controller (rev 10)
00:17.0 SATA controller: Intel Corporation Cannon Lake PCH SATA AHCI Controller (rev 10)
00:1b.0 PCI bridge: Intel Corporation Device a340 (rev f0)
00:1b.4 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port 21 (rev f0)
00:1c.0 PCI bridge: Intel Corporation Device a338 (rev f0)
00:1c.4 PCI bridge: Intel Corporation Device a33c (rev f0)
00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port 9 (rev f0)
00:1f.0 ISA bridge: Intel Corporation Device a305 (rev 10)
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI Controller (rev 10)
01:00.0 VGA compatible controller: NVIDIA Corporation Device 1f02 (rev a1)
01:00.1 Audio device: NVIDIA Corporation Device 10f9 (rev a1)
01:00.2 USB controller: NVIDIA Corporation Device 1ada (rev a1)
01:00.3 Serial bus controller [0c80]: NVIDIA Corporation Device 1adb (rev a1)
03:00.0 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
03:00.1 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
03:00.2 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
03:00.3 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)
06:00.0 Non-Volatile memory controller: Micron/Crucial Technology Device 2263 (rev 03)
```

Filter out specific device information with grep.

```bash
$ lspci -v | grep "VGA" -A 12
```

### lsscsi - List scsi devices
Lists out the scsi/sata devices like hard drives and optical drives.
```bash
sudo apt install lsscsi
```

### lsusb - List usb buses and device details
This command shows the USB controllers and details about devices connected to them. By default brief information is printed. Use the verbose option "-v" to print detailed information about each usb port

```bash
$ lsusb
```
On the above system, 1 usb port is being used by the mouse.

### Inxi
Inxi is a 10K line mega bash script that fetches hardware details from multiple different sources and commands on the system, and generates a beautiful looking report that non technical users can read easily.

```bash
$ inxi -Fx
```
### lsblk - List block devices
List out information all block devices, which are the hard drive partitions and other storage devices like optical drives and flash drives
```bash
$ lsblk
```

### df - disk space of file systems

Reports various partitions, their mount points and the used and available space on each.
```bash
$ df -H
```

### Pydf - Python df

An improved df version written in python, that displays colored output that looks better than df
```bash
$ pydf
```

### fdisk

Fdisk is a utility to modify partitions on hard drives, and can be used to list out the partition information as well.
```bash
$ sudo fdisk -l
```

### mount

The mount is used to mount/unmount and view mounted file systems.
```bash
$ mount | column -t
```
Again, use grep to filter out only those file systems that you want to see

```bash
$ mount | column -t | grep ext
```

### free - Check RAM
Check the amount of used, free and total amount of RAM on system with the free command.
```bash
$ free -m
```

### dmidecode

The dmidecode command is different from all other commands. It extracts hardware information by reading data from the SMBOIS data structures (also called DMI tables).

```bash
## display information about the processor/cpu
$ sudo dmidecode -t processor
## memory/ram information
$ sudo dmidecode -t memory
## bios details
$ sudo dmidecode -t bios
```

Check out the man page for more details.

## /proc files

Many of the virtual files in the /proc directory contain information about hardware and configurations. Here are some of them

CPU/Memory information

```bash
## cpu information
$ cat /proc/cpuinfo
## memory information
$ cat /proc/meminfo
```

Linux/kernel information

```bash
$ cat /proc/version
Linux version 3.11.0-12-generic (buildd@allspice) (gcc version 4.8.1 (Ubuntu/Linaro 4.8.1-10ubuntu7) ) #19-Ubuntu SMP Wed Oct 9 16:20:46 UTC 2013
```

SCSI/Sata devices

```bash
$ cat /proc/scsi/scsi
```

Partitions

```bash
$ cat /proc/partitions
```

### hdparm

The hdparm command gets information about sata devices like hard disks.
```bash
$ sudo hdparm -i /dev/sda
```

