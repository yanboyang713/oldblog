---
title: "Using Ceph with Proxmox"
date: 2021-12-29T12:23:00+08:00
tags: ["ceph", "proxmox"]
categories: ["Cluster"]
draft: false
---

## Objective {#objective}

This guide explains how to set up the Cloud Disk Array on Proxmox.


## Requirements {#requirements}

Fist of all, you need your Cloud Disk Array up and ready. Make sure you have:

created a cluster pool for storing data
created a Ceph user that Proxmox will use to access the CDA cluster
configured permissions for this user and pool (allow read and write)
configured your IP access control list to allow Proxmox nodes to access the CDA


## Reference List {#reference-list}

1.  <https://docs.ovh.com/sg/en/storage/ceph/use-ceph-with-proxmox/>
2.  <https://www.proxmox.com/en/training/video-tutorials/item/install-ceph-server-on-proxmox-ve>
