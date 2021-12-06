# Proxmox PCI Passthrough


## Introduction {#introduction}

PCI passthrough allows you to use a physical PCI device (graphics card, network card) inside a VM (KVM virtualization only).

If you "**PCI passthrough**" a device, the device is not available to the host anymore.

**Note**:
PCI passthrough is an experimental feature in Proxmox VE! VMs with passthroughed devices cannot be **migrated**.


## Enable the IOMMU {#enable-the-iommu}

First open your bootloader kernel command line config file.

```bash
vim /etc/default/grub
```

Find line **GRUB\_CMDLINE\_LINUX\_DEFAULT="quiet"**

Change to:

**GRUB\_CMDLINE\_LINUX\_DEFAULT="quiet intel\_iommu=on"**

Then save the changes and update grub:

```bash
update-grub
```

and than, reboot your PVE

```bash
reboot
```

Verify IOMMU is enabled

after reboot, then run:

```bash
dmesg | grep -e DMAR -e IOMMU
```

There should be a line that looks like "DMAR: IOMMU enabled". If there is no output, something is wrong.

Add **PT** Mode,
Both Intel and AMD chips can use the additional parameter "iommu=pt", added in the same way as above to the kernel cmdline.

```file
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt"
```

This enables the IOMMU translation only when necessary, the adapter does not need to use DMA translation to the memory, and can thus improve performance for hypervisor PCIe devices (which are not passthroughed to a VM)

than, update grub and root

```bash
update-grub
reboot
```


## Add required Modules {#add-required-modules}

add to /etc/modules (default is empty)

```file
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
```

Then, reboot. Well Done

