---
title: "Setting up an ubuntu Router with bridge"
date: 2020-09-04T06:11:32+10:00
tags: [ "Networking" ]
categories: [ "Networking" ]
---
## Introduction
This post document is about how to build a Linux gateway base on Ubuntu OS. The gateway connects an internal network to an external network. Basically, performing Network Address Translation (NAT) for hosts on the internal network. It is exceptionally similar to what your home router does.

## User Scenario
1. Acting as a router at home or in office as a local area network.
2. Connecting multi-network cameras to Ubuntu Server for transfer image data.

## Terminology
1. **interface** is used to mean the operating system's name for a place which sends or receives data packets. It is often, but not necessarily, the same as a device. An interface may have several devices associated (e.g. a bridge), or a single device may have several interfaces. device will refer here to the bit of hardware dealing with your network connections. 
2. A **network adapter** is the component of a computer’s internal hardware that is used for communicating over a network with another computer. It enable a computer to connect with another computer, server or any networking device over an LAN connection. A network adapter can be used over a wired or wireless network.
3. A **gateway** is a piece of networking hardware used in telecommunications for telecommunications networks that allows data to flow from one discrete network to another. Gateways are distinct from routers or switches in that they communicate using more than one protocol to connect a bunch of networks and can operate at any of the seven layers of the open systems interconnection model (OSI). 

## Hardware Requirments
In our scenario, we need one multi-port network adapters with your desktop PC at the less. One port for connect with external network. Others for connect internal network. Because, we have muti-devices need to connect to internal network, So I recommand, we can using monther-board wired adapter connect with external network and one multi-port PCIE network card connect with internal network. All of PCIE network card can be connect to a bridge. The details how to set-up, I will talk at the below.

**Tips, there are two type of PCIE adapters can be use in our project. First type have POE (Power over Ethernet) support and another type does not support POE. I recommend you buy a PoE support card because when you want to connect a network camera or access point (AP), which can be power by PCIE card directly, you need not unnecessary power cable and power supply to power cameras or APs, this will convience for you. 4 port Gigabit POE network card about 120 US dollars.**

## Settings
### Configuring the bridge and Network file settings
Linux supports the implementation of a software network bridge to reproduce the function of a network bridge, a networking device that interconnects two or more communication networks or network segments providing a way for them to work as a single network.
It acts almost like a network switch, and in a software sense, it is used to implement the concept of a “virtual network switch”.

In our scenario, we will use software network bridging to connect all of ports for PCIE network card directly to the host server network.
If you want to you also can add your virtual machines(VMs) to this bridge.
This way, the all of PCIE ports are deployed on the same subnet as the host and can access services such as DHCP and much more.

#### Installing Network Bridge Utilities
Begin by installing the bridge-utils package which contains utilities for configuring the Ubuntu ethernet bridge using the apt package manager as shown.

```bash
sudo apt-get update
sudo apt-get install bridge-utils
```

#### Distinguish External and Internal Interfaces' Name
Identify the interface name for your ethernet device using the IP command as shown.

```bash
$ ip ad
OR
$ ip add
```

![ip add](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599389099/setting%20up%20an%20ubuntu%20router%20with%20bridge%20-%20ip%20addr.png)

From this screenshot, as you can see:
1. **enp5s0 interface** is my monther-board wired adapter(only have one port) connect with external network
2. **enp3s0f0 interface**, **enp3s0f1 interface**, **enp3s0f2 interface** and **enp3s0f3 interface** are my PCIE network card (4 ports)
3. **br0** is my bridge, which connect with all of PCIE ports. The bridge will as internal network. This interface have not yet. Please following the next creating the bridge section.

#### Creating and Setting the Bridge at Start-up
We need to edit the /etc/network/interfaces file. This file shows an example of a bridge configure.

Sample /etc/network/interfaces file
```
auto lo
iface lo inet loopback

##External Interface
auto enp5s0
iface enp5s0 inet dhcp

##bridge
auto br0
iface br0 inet static
    address 192.168.1.1
    network 192.168.1.0
    netmask 255.255.255.0
    broadcast 192.168.1.255
    bridge-ports enp3s0f0 enp3s0f1 enp3s0f2 enp3s0f3

```

** TIPS: please run the below command backup your interfaces file first.
```bash
cp /etc/network/interfaces /etc/network/interfaces.backup
```
From this interface configure file, you can see:
1. External interface will use Dynamic Host Configuration Protocol (DHCP), whereby external network DHCP server will dynamically assigns an IP adress and other network configuration paprameters to this external interface.
2. Created a new interface, names *br0*. Using static settings, I manuelly assign IP address 192.168.1.1 to this bridge, when you set-up internal network clients 192.168.1.1 should be the gateway. internal network IP should be 192.168.1.x(x minimum valu is 2, the maxmum value is 255)
3. All of my PCIE ports connected with this bridge.

** When you finished settings for this section, please restart networking. The command at the below **

```bash
sudo /etc/init.d/networking restart 
```
### Enable IP forwarding and Masquerading
Doing the above might not be enough to make the Ubuntu machine a real router which does NAT (Network Address Translation) and IP Forwarding. The following script configures the Kernel IPTable and IP forwarding. You will have to configure at least the script's 2 variables; the 1st is the external network interface; the 2nd is the internal network interface.

```bash
echo -e "\n\nLoading simple rc.firewall-iptables version $FWVER..\n"
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe

EXTIF="eth0" # Change eth0 as your External Network Interface Name
INTIF="eth1" # Change eth1 as bridge name (Internal Network Interface)

echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"

##======================================================================
##== No editing beyond this line is required for initial MASQ testing == 
echo -en "   loading modules: "
echo "  - Verifying that all kernel modules are ok"
$DEPMOD -a
echo "----------------------------------------------------------------------"
echo -en "ip_tables, "
$MODPROBE ip_tables
echo -en "nf_conntrack, " 
$MODPROBE nf_conntrack
echo -en "nf_conntrack_ftp, " 
$MODPROBE nf_conntrack_ftp
echo -en "nf_conntrack_irc, " 
$MODPROBE nf_conntrack_irc
echo -en "iptable_nat, "
$MODPROBE iptable_nat
echo -en "nf_nat_ftp, "
$MODPROBE nf_nat_ftp
echo "----------------------------------------------------------------------"
echo -e "   Done loading modules.\n"
echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "   Enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr 
echo "   Clearing any existing rules and setting default policy.."

iptables-restore <<-EOF
*nat
-A POSTROUTING -o "$EXTIF" -j MASQUERADE
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A FORWARD -i "$EXTIF" -o "$INTIF" -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT 
-A FORWARD -i "$INTIF" -o "$EXTIF" -j ACCEPT
-A FORWARD -j LOG
COMMIT
EOF

echo -e "\nrc.firewall-iptables v$FWVER done.\n"
```

After configuring the 2 variables, save the script below as nat.sh and make it executable by doing

```bash
chmod a+x nat.sh
```

Now, test the script by running as root

```bash
sudo sh nat.sh
```

### Clients network settings
Each clients at the less MUST setting the corrent IP address, netmask, gateway and DNS.

** TIPS:
If you using the above bridge settings, you can following the below list to set-up your client network interface.
1. The bridge IP is 192.168.1.1, so your clent IP should be 192.168.1.x (x minimum valu is 2, the maxmum value is 255), all of clients IP must be unique within this internal network(subnet).
2. netmask should be 255.255.255.0
3. gateway should be 192.168.1.1, which is bridge's IP address
4. DNS can be setting as your ISP DNS or public DNS, such as Google's DNS 8.8.8.8, 8.8.4.4
**

#### For Linux
##### Using ifconfig
Setting up IP address and Netmask command line
```bash
sudo ifconfig eth0 192.168.1.2 netmask 255.255.255.0
```
** TIPS: **
1. eth0 is network interface name, you need change this.
2. 192.168.1.2 is client IP address you want to set.
3. netmask 255.255.255.0 is good.

Setting up gateway command line
```bash
sudo route add default gw 192.168.1.1 eth0
```

** TIPS: **
1. eth0 is network interface name, you need change this.
2. *gw xxx.xxx.xxx.xxx* is your gateway IP address 

##### Ubuntu GUI

![Editing wired connection](https://i0.wp.com/www.opensourceforu.com/wp-content/uploads/2015/03/fig5.png?resize=350%2C374&ssl=1)

#### For Mac
1. On your Mac, choose Apple menu > System Preferences, then click Network.
2. Select the network connection you want to use (such as Ethernet) in the list.
3. Choose Manually and enter the address in the IP Address field. Also, subnet mask, gateway, and Domain Name System (DNS) server address.

#### For Windows
1. Open Start on Windows 10.
2. Search for Command Prompt, right-click the result and select the Run as administrator option to open the console.
3. Type the following command to see your current networking configuration and press Enter:
```bash
ipconfig /all
```
4. Type the following command to assign a static IP address and press Enter:
```bash
netsh interface ip set address name="Ethernet0" static 192.168.1.2 255.255.255.0 192.168.1.1
```
In the above command make sure to change Ethernet0 for the name of your network adapter, and you must change 192.168.1.2 255.255.255.0 192.168.1.1 with the device IP address, subnet mask, and default gateway address that corresponds to your network configuration.

5. Type the following command to set a DNS server address and press Enter:
```bash
netsh interface ip set dns name="Ethernet0" static 10.1.2.1
```
In the above command make sure to change Ethernet0 with the name of your adapter and 10.1.2.1 with the DNS server address of your network.
6. Type the following command to set an alternate DNS server address and press Enter:
```bash
netsh interface ip add dns name="Ethernet0" 8.8.8.8 index=2
```
In the above command make sure to change Ethernet0 with the name of your adapter and 8.8.8.8 with an alternate DNS server address.

** After you complete the steps, you can test the new configuration using the ping command (for example, ping google.com) to see if the internet is working. Alternatively, you can simply open your web browser and try to navigate to a website to see if the configuration works. **

## Troubleshooting


