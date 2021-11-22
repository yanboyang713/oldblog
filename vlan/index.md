# Getting Started Configuring VLANs on Proxmox


## Introduction {#introduction}

A virtualization server allows you to run multiple machines, virtual machines (VMs), on one physical device, also known as the host. There could be many different VMs each for different tasks. In this guide, we will discuss configuring your Proxmox virtualization server to use VLANs so that you can group related VMs onto their own subnet.


## Motivation {#motivation}

For security, as well as organizational purposes, physical machines are often separated on the network from each other by VLANs. By logically separating devices based on their functionality with these VLANs, we can make sure that our family's personal devices aren't sitting out in the open on the same subnet exposed to our internet-facing web servers. This is fairly easy on your regular network setup because the devices are physically separate from each other and so each ethernet port physically connected to a device can be assigned an individual VLAN.

However, this system starts to break down when faced with virtualization servers. This is because diverse virtual machines are all sitting on the same physical host, forcing each VM to share the same physical connection. With a standard bridge between the individual VM and the host's NIC, we necessarily end up with each VM on the same subnet as the Proxmox host itself. Additionally, we end up with each VM on the same subnet as every other VM on that host. Not ideal.


## Solution {#solution}

Thankfully there's a way around this. In Proxmox, you can make your virtual bridge VLAN-aware so you can pass multiple VLANs through to your Proxmox server using only a single physical port. The individual VMs can then be configured to use whichever VLAN you choose.

