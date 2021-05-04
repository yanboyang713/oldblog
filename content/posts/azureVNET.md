---
title: "Azure Networking"
date: 2021-01-05T06:11:32+10:00
tags: [ "VNET" ]
categories: [ "Azure" ]
---
## Create a virtual network using the Azure CLI
A virtual network enables Azure resources, like virtual machines (VMs), to communicate privately with each other, and with the internet. In this quickstart, you learn how to create a virtual network. After creating a virtual network, you deploy two VMs into the virtual network. You then connect to the VMs from the internet, and communicate privately over the new virtual network.

### Create a resource group and a virtual network
Before you can create a virtual network, you have to create a resource group to host the virtual network. Create a resource group with az group create. This example creates a resource group named myResourceGroup in the eastus location:

```bash
az group create --name myResourceGroup --location eastus
```

Create a virtual network with az network vnet create. This example creates a default virtual network named myVirtualNetwork with one subnet named default:

```bash
az network vnet create \
  --name myVirtualNetwork \
  --resource-group myResourceGroup \
  --subnet-name default
```

### Create virtual machines
Create two VMs in the virtual network.
### Create the first VM
Create a VM with az vm create. If SSH keys don't already exist in a default key location, the command creates them. To use a specific set of keys, use the --ssh-key-value option. The --no-wait option creates the VM in the background, so that you can continue to the next step. This example creates a VM named myVm1:

```console
boyang@Azure:~$ az vm create \
>   --resource-group myResourceGroup \
>   --name myVm1 \
>   --image UbuntuLTS \
>   --generate-ssh-keys \
>   --no-wait
SSH key files '/home/boyang/.ssh/id_rsa' and '/home/boyang/.ssh/id_rsa.pub' have been generated under ~/.ssh to allowSSH access to the VM. If using machines without permanent storage, back up your keys to a safe location.
```

### Create the second VM
Since you used the --no-wait option in the previous step, you can go ahead and create the second VM named myVm2.

```console
boyang@Azure:~$ az vm create \
>   --resource-group myResourceGroup \
>   --name myVm2 \
>   --image UbuntuLTS \
>   --generate-ssh-keys
{- Finished ..
  "fqdns": "",
  "id": "/subscriptions/bfc7bf32-524b-4960-802a-e2881b6ab634/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVm2",
  "location": "eastus",
  "macAddress": "00-0D-3A-11-56-48",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.5",
  "publicIpAddress": "52.186.147.136",
  "resourceGroup": "myResourceGroup",
  "zones": ""
}
```

**NOTE:** The publicIpAddress. You will use this address to connect to the VM from the internet in the next step.

### Connect to a VM from the internet
In this command, replace <publicIpAddress> with the public IP address of your myVm2 VM:
```bash
ssh 52.186.147.136
```

## NSG

## Create VM
### Create a public IP address for the MySQL VM.

```bash
az network public-ip create \
  --resource-group $RgName \
  --name MyPublicIP-Sql
```

### Create a NIC for the MySQL VM.

```bash
az network nic create \
  --resource-group $RgName \
  --name MyNic-Sql \
  --vnet-name MyVnet \
  --subnet MySubnet-BackEnd \
  --network-security-group MyNsg-BackEnd \
  --public-ip-address MyPublicIP-Sql
```

### Create a MySQL VM in the back-end subnet.

```bash
az vm create \
  --resource-group $RgName \
  --name MyVm-Sql \
  --nics MyNic-Sql \
  --image UbuntuLTS \
  --admin-username azureadmin \
  --generate-ssh-keys
```
