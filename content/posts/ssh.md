---
title: "SSH server set-up with multi-user and Security Practices"
date: 2020-09-08T06:11:32+10:00
tags: [ "Networking", "SSH" ]
categories: [ "Networking" ]
---
## Introduction
This post document is about how to set-up SSH server base on Ubuntu OS. A lots of users have some concerns about SSH security, especially when multi-user or multi-group share to use with same SSH tunnel. So, this article will fouce on SSH server security practices with multi-user. In this article, first I will talk Linux User and Group Management.

**TIPS:**
When you using SSH connect with a host, CLI Text Editor is importance for editing some of config file. I recommand you using VIM, if you don't know how to use VIM, please have a look {% post_link vim %}

## User Scenario
1. Multi-user connect to cloud Virtual Machine(VM) using SSH is the most used scenario.
2. Using SSH configure Edge Devices 

## Linux user and group management
Since Linux is a multi-user operating system, several people may be logged in and actively working on a given machine at the same time. Security-wise, it is never a good idea to allow users to share the credentials of the same account. In fact, best practices dictate the use of as many user accounts as people needing access to the machine.

At the same time, it is to be expected that two or more users may need to share access to certain system resources, such as directories and files. User and group management in Linux allows us to accomplish both objectives.

