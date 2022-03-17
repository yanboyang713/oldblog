---
title: "Virtualize Windows 11 with Proxmox"
date: 2021-12-20T12:37:00+11:00
tags: ["windows", 11, "proxmox", "pve"]
categories: ["Windows"]
draft: false
---

## Introduction {#introduction}

As Microsoft released Windows 11, it was made clear that TPM 2.0 and Secure boot is no longer optional but mandatory, without these capabilities on the hardware/virtual hardware, Windows 11 refuse to install.


## Step 1: Download Windows 11 ISO {#step-1-download-windows-11-iso}

You can click [Here](https://www.microsoft.com/software-download/windows11) for download ISO file.


## Step 2: Download virtio-win drivers disk {#step-2-download-virtio-win-drivers-disk}

You can click [Here](https://github.com/virtio-win/virtio-win-pkg-scripts), download Latest virtio-win ISO.


## Step 3: Upload Windows 11 ISO and Latest virtio-win ISO to ProxMox {#step-3-upload-windows-11-iso-and-latest-virtio-win-iso-to-proxmox}

login to ProxMox -&gt; choose Node -&gt; local (pve) -&gt; ISO Images -&gt; Upload


## Step 4: Create VM {#step-4-create-vm}

Click **Create VM** -&gt; **General**: name: Windows 11

-&gt; **OS**: choose boot OS: ISO image choose Win11 ISO; Type: Microsoft Windows; Version: 11/2022

-&gt; System: SCSI Controller: VirtIO SCSI
Machine: q35
Qemu Agent: Enable
BIOS: OVMF (UEFI)
Add TPM: Enable Version: v2.0
EFI Storage and TPM Storage **should use same storage**

-&gt; Disks:
Bus/Device: VirtIO Block
Disk size (GiB): 64

-&gt; CPU:
Cores: 2
Type: host

-&gt; Memory:
Memory (MiB): 8192

-&gt; Network:
Bridge: vmbr0
Model: VirtIO (paravirtualized)

OK, we done! However, **Don't Start it**


## Step 5: Add virtio-win ISO {#step-5-add-virtio-win-iso}

Hardware -&gt; Add -&gt; CD/DVD Drive -&gt; choose IDE and your downloaded ISO


## Step 6: Check Boot Order {#step-6-check-boot-order}

Options -&gt; Boot Order
Make sure your boot Win11 at the begging

Now, ready to start this VM.


## Step 6: Start {#step-6-start}


## Reference List {#reference-list}

1.  <https://www.youtube.com/watch?app=desktop&v=fupuTkkKPDU>
2.  <https://dannyda.com/2021/10/08/how-to-install-windows-11-on-proxmox-ve-pve-without-workarounds/>
