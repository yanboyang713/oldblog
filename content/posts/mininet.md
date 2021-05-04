---
title: "Getting Started Mininet"
date: 2021-03-00T06:11:32+10:00
tags: [ "mininet", "SDN" ]
categories: [ "networking" ]
---
## Mininet Overview
Mininet is a network emulator which creates a network of virtual hosts, switches, controllers, and links. Mininet hosts run standard Linux network software, and its switches support OpenFlow for highly flexible custom routing and Software-Defined Networking.

Mininet supports research, development, learning, prototyping, testing, debugging, and any other tasks that could benefit from having a complete experimental network on a laptop or other PC.

![](http://mininet.org/images/frontpage_diagram.png)

**Mininet**:
+ Provides a simple and inexpensive **network testbed** for developing OpenFlow applications
+ Enables multiple concurrent developers to work independently on the same topology
+ Supports system-level regression tests, which are repeatable and easily packaged
+ Enables complex topology testing, without the need to wire up a physical network
+ Includes a CLI that is topology-aware and OpenFlow-aware, for debugging or running network-wide tests
+ Supports arbitrary custom topologies, and includes a basic set of parametrized topologies
+ is usable out of the box without programming, but
+ also Provides a straightforward and extensible Python API for network creation and experimentation.

Mininet provides an easy way to get correct system behavior (and, to the extent supported by your hardware, performance) and to experiment with topologies.

Mininet networks run real code including standard Unix/Linux network applications as well as the real Linux kernel and network stack (including any kernel extensions which you may have available, as long as they are compatible with network namespaces.)

Because of this, the code you develop and test on Mininet, for an OpenFlow controller, modified switch, or host, can move to a real system with minimal changes, for real-world testing, performance evaluation, and deployment. Importantly this means that a design that works in Mininet can usually move directly to hardware switches for line-rate packet forwarding.

### How it Works
Nearly every operating system virtualizes computing resources using a process abstraction. Mininet uses process-based virtualization to run many (we’ve successfully booted up to 4096) hosts and switches on a single OS kernel. Since version 2.2.26, Linux has supported network namespaces, a lightweight virtualization feature that provides individual processes with separate network interfaces, routing tables, and ARP tables. The full Linux container architecture adds chroot() jails, process and user namespaces, and CPU and memory limits to provide full OS-level virtualization, but Mininet does not require these additional features. Mininet can create kernel or user-space OpenFlow switches, controllers to control the switches, and hosts to communicate over the simulated network. Mininet connects switches and hosts using virtual ethernet (veth) pairs. While Mininet currently depends on the Linux kernel, in the future it may support other operating systems with process-based virtualization, such Solaris containers or !FreeBSD jails.

Mininet’s code is almost entirely Python, except for a short C utility.

### Why it’s better
Mininet combines many of the best features of emulators, hardware testbeds, and simulators.

Compared to full system virtualization based approaches, Mininet:

+ Boots faster: seconds instead of minutes
+ Scales larger: hundreds of hosts and switches vs. single digits
+ Provides more bandwidth: typically 2Gbps total bandwidth on modest hardware
+ Installs easily: a prepackaged VM is available that runs on VMware or VirtualBox for Mac/Win/Linux with OpenFlow v1.0 tools already installed.

Compared to hardware testbeds, Mininet

+ is inexpensive and always available (even before conference deadlines)
+ is quickly reconfigurable and restartable

Compared to simulators, Mininet

+ runs real, unmodified code including application code, OS kernel code, and control plane code (both OpenFlow controller code and Open vSwitch code)
+ easily connects to real networks
+ offers interactive performance - you can type at it

### Limitations
Mininet-based networks cannot (currently) exceed the CPU or bandwidth available on a single server.

Mininet cannot (currently) run non-Linux-compatible OpenFlow switches or applications; this has not been a major issue in practice.

## Installing

```bash
yay -S mininet
```

## Practice One

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1616950458/mininet/practiceOne_asmua8.png)

```console
[yanboyang713@boyang ~]$ sudo mn
*** Creating network
*** Adding controller
*** Adding hosts:
h1 h2 
*** Adding switches:
s1 
*** Adding links:
(h1, s1) (h2, s1) 
*** Configuring hosts
h1 h2 
*** Starting controller
c0 
*** Starting 1 switches
s1 ...
*** Starting CLI:
mininet> 
```

**NOTE:**
If you faced "ovs-vsctl: unix:/run/openvswitch/db.sock: database connection failed (No such file or directory) ovs-vsctl exited with code 1 Error connecting to ovs-db with ovs-vsctl Make sure that Open vSwitch is installed, that ovsdb-server is running, and that "ovs-vsctl show" works correctly.

Please, go ahead.

```bash
sudo systemctl start ovs-vswitchd.service
sudo systemctl enable ovs-vswitchd.service
```

```console
mininet> net
h1 h1-eth0:s1-eth1
h2 h2-eth0:s1-eth2
s1 lo:  s1-eth1:h1-eth0 s1-eth2:h2-eth0
c0
mininet> 
```

```console
mininet> links
h1-eth0<->s1-eth1 (OK OK) 
h2-eth0<->s1-eth2 (OK OK) 
mininet> 
```

```console
mininet> exit
*** Stopping 1 controllers
c0 
*** Stopping 2 links
..
*** Stopping 1 switches
s1 
*** Stopping 2 hosts
h1 h2 
*** Done
completed in 896.731 seconds
```

## Practice Two

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1616950557/mininet/practiceTwo_idqc3a.png)

```console
[yanboyang713@boyang ~]$ sudo mn --topo=single,3
*** Creating network
*** Adding controller
*** Adding hosts:
h1 h2 h3 
*** Adding switches:
s1 
*** Adding links:
(h1, s1) (h2, s1) (h3, s1) 
*** Configuring hosts
h1 h2 h3 
*** Starting controller
c0 
*** Starting 1 switches
s1 ...
*** Starting CLI:
mininet> 
```

## Practice Three

```console
[yanboyang713@boyang ~]$ sudo mn -c
[sudo] password for yanboyang713: 
*** Removing excess controllers/ofprotocols/ofdatapaths/pings/noxes
killall controller ofprotocol ofdatapath ping nox_corelt-nox_core ovs-openflowd ovs-controllerovs-testcontroller udpbwtest mnexec ivs ryu-manager 2> /dev/null
killall -9 controller ofprotocol ofdatapath ping nox_corelt-nox_core ovs-openflowd ovs-controllerovs-testcontroller udpbwtest mnexec ivs ryu-manager 2> /dev/null
pkill -9 -f "sudo mnexec"
*** Removing junk from /tmp
rm -f /tmp/vconn* /tmp/vlogs* /tmp/*.out /tmp/*.log
*** Removing old X11 tunnels
*** Removing excess kernel datapaths
ps ax | egrep -o 'dp[0-9]+' | sed 's/dp/nl:/'
***  Removing OVS datapaths
ovs-vsctl --timeout=1 list-br
ovs-vsctl --timeout=1 list-br
*** Removing all links of the pattern foo-ethX
ip link show | egrep -o '([-_.[:alnum:]]+-eth[[:digit:]]+)'
ip link show
*** Killing stale mininet node processes
pkill -9 -f mininet:
*** Shutting down stale tunnels
pkill -9 -f Tunnel=Ethernet
pkill -9 -f .ssh/mn
rm -f ~/.ssh/mn/*
*** Cleanup complete.
[yanboyang713@boyang ~]$ 
```

## Practice Four

+ 线性拓扑(Linear)拓扑：
     sudo mn --topo=linear,4 # 主机数=交换机数=4
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1616950915/mininet/LinearTopo_z5ne51.png)

+ 树形拓扑(Tree)：
     sudo mn --topo=tree,depth=2,fanout=2 # 深度为2，设备下挂设备数为2

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1616950941/mininet/TreeTopo_nvvuna.png)

+ 自定义拓扑(Custom)：
     sudo mn --custom file.py --topo mytopo



