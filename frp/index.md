# Getting Started with Reverse Proxy

## What is frp?
frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.

frp also has a P2P connect mode.

## Architecture
[architecture](https://github.com/fatedier/frp/blob/dev/doc/pic/architecture.png)

## Installation
1. Download the latest programs from [Release](https://github.com/fatedier/frp/releases) page according to your operating system and architecture.

There is a example:
```console
yanboyang713@boyang$ wget https://github.com/fatedier/frp/releases/download/v0.34.0/frp_0.34.0_linux_amd64.tar.gz
yanboyang713@boyang$ tar -xzf frp_0.34.0_linux_amd64.tar.gz
yanboyang713@boyang$ cd frp_0.34.0_linux_amd64
yanboyang713@boyang$ ls
frpc  frpc_full.ini  frpc.ini  frps  frps_full.ini  frps.ini  LICENSE  systemd
```
2. Put frps and frps.ini onto your server A (usually is cloud VM) with public IP.
There is a example:
```console
yanboyang713@boyang:~/Downloads/frp_0.34.0_linux_amd64$ sftp boyyan@52.141.58.83
boyyan@52.141.58.83's password: 
Connected to 52.141.58.83.
sftp> ls
sftp> lls
frpc  frpc_full.ini  frpc.ini  frps  frps_full.ini  frps.ini  LICENSE  systemd
sftp> put frps.ini
Uploading frps to /home/boyyan/frps.ini
frps.ini  
sftp> put frps
Uploading frps to /home/boyyan/frps
frps                                                               100%   13MB   7.4MB/s   00:01    
sftp> ls
frps      frps.ini  
sftp> exit
```
3. Put frpc and frpc.ini onto your server B in LAN (that can't be connected from public Internet).

## Access your computer in LAN by SSH
1. Modify frps.ini on server A and set the bind_port to be connected to frp clients:
```
[common]
bind_port = 7000
```
2. Start frps on server A:
```console
./frps -c ./frps.ini
```
3. On server B, modify frpc.ini to put in your frps server public IP as server_addr field:
```
[common]
server_addr = 20.194.22.192
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000
```
**Note** that local_port (listened on client) and remote_port (exposed on server) are for traffic goes in/out the frp system, whereas server_port is used between frps.

4. Start frpc on server B:
```
./frpc -c ./frpc.ini
```
5. From another machine, SSH to server B like this (assuming that username is test):
```console
ssh -oPort=6000 test@x.x.x.x
```


