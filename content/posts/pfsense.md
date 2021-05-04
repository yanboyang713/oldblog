---
title: "pfSense with Proxmox"
date: 2020-02-04T06:11:32+10:00
cateories: [ "Proxmox" ]
---
## Introduction

## Virtualizing pfSense with Proxmox
This following article is about building and running a pfSense® virtual machine under Proxmox 4.4. The guide applies to any newer Proxmox version. Article covers Proxmox networking setup and pfSense virtual machine setup process. The guide does not cover how to install Proxmox. A basic, working, pfSense virtual machine will exist by the end of this article.

## Install Open vSwitch
Update the package index and then install the Open vSwitch packages by executing:
```bash
 apt update
 apt install openvswitch-switch
```

https://docs.netgate.com/pfsense/en/latest/recipes/virtualize-proxmox.html

