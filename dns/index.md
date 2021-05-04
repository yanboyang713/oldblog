# dns

## Introduction
DNS is a short abbreviation for Domain Name Service which maps the IP and FQDN (Fully Qualified Domain Names) to one another. And by that, the DNS makes it easy to remember the IP. Name servers are the computers that run the DNS.

So in this tutorial, we are going to install and configure DNS on Ubuntu. Through this tutorial, we will use one of the most common programs used for handling the name server on Ubuntu that is BIND (which is an abbreviation for Berkley Internet Naming Daemon).

An important part of managing server configuration and infrastructure includes maintaining an easy way to look up network interfaces and IP addresses by name, by setting up a proper Domain Name System (DNS). Using fully qualified domain names (FQDNs), instead of IP addresses, to specify network addresses eases the configuration of services and applications, and increases the maintainability of configuration files. Setting up your own DNS for your private network is a great way to improve the management of your servers.

In this tutorial, we will go over how to set up an internal DNS server, using the BIND name server software (BIND9) on Ubuntu 18.04, that can be used by your servers to resolve private hostnames and private IP addresses. This provides a central way to manage your internal hostnames and private IP addresses, which is indispensable when your environment expands to more than a few hosts.

http://www.damagehead.com/blog/2015/04/28/deploying-a-dns-server-using-docker/

## DNS Basics
The Domain Name System (DNS) is an application-layer protocol that is part of the standard TCP/IP protocol suite. This protocol implements the DNS name service, which is the name service used on the Internet.

### Name-to-Address Resolution
Though it supports the complex, world-wide hierarchy of computers on the Internet, the basic function of DNS is actually very simple: providing name-to-address resolution for TCP/IP-based networks. Name-to-address resolution, also referred to as "mapping," is the process of finding the IP address of a computer in a database by using its host name as an index.

Name-to-address mapping occurs when a program running on your local machine needs to contact a remote computer. The program most likely will know the host name of the remote computer but may not know how to locate it, particularly if the remote machine is in another company, miles from your site. To get the remote machine's address, the program requests assistance from the DNS software running on your local machine, which is considered a DNS client.

Your machine sends a request to a DNS name server, which maintains the distributed DNS database. The files in the DNS database bear little resemblance to the NIS+ host or ipnodes Table or even the local /etc/hosts or /etc/inet/ipnodes file, though they maintain similar information: the host names, the ipnode names, IPv4 and IPv6 addresses, and other information about a particular group of computers. The name server uses the host name your machine sent as part of its request to find or "resolve" the IP address of the remote machine. It then returns this IP address to your local machine IF the host name is in its DNS database.

Below image shows name-to-address mapping as it occurs between a DNS client and a name server, probably on the client's local network.
![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2384.epsi.gif)

If the host name is not in that name server's DNS database, this indicates that the machine is outside of its authority, or, to use DNS terminology, outside the local administrative domain. Thus, each name server is spoken of as being "authoritative" for its local administrative domain.

Fortunately, the local name server maintains a list of host names and IP addresses of root domain name servers, to which it will forward the request from your machine. These root name servers are authoritative for huge organizational domains, as explained fully in "DNS Hierarchy and the Internet". These hierarchies resemble UNIX file systems, in that they are organized into an upside-down tree structure.

Each root name server maintains the host names and IP address of top level domain name servers for a company, a university, or other large organizations. The root name server sends your request to the top-level name servers that it knows about. If one of these servers has the IP address for the host you requested, it will return the information to your machine. If the top-level servers do not know about the host you requested, they pass the request to second-level name servers for which they maintain information. Your request is then passed on down through the vast organizational tree. Eventually, a name server that has information about your requested host in its database will return the IP address back to your machine.

Image shows name-to-address resolution outside the local domain at the below.
![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2385.epsi.gif)

### DNS Administrative Domains

From a DNS perspective, an administrative domain is a group of machines that are administered as a unit. Information about this domain is maintained by at least two name servers; they are "authoritative" for the domain. The DNS domain is a purely logical grouping of machines. It could correspond to a physical grouping of machines, such as all machines attached to the Ethernet in a small business. But a local DNS domain just as likely could include all machines on a vast university network that belong to the computer science department or to university administration.

For example, suppose the Ajax company has two sites, one in San Francisco and one in Seattle. The Retail.Sales.Ajax.com. domain might be in Seattle and the Wholesale.Sales.Ajax.com. domain might be in San Francisco. One part of the Sales.Ajax.com. domain would be in one city, the other part in the second city.

Each administrative domain must have its own unique subdomain name. Moreover, if you want your network to participate in the Internet, the network must be part of a registered administrative domain. The section "Joining the Internet" has full details about domain names and domain registration.

### DNS Name Servers
There are three types of DNS name servers:
+ Primary server
+ Secondary server
+ Cache-only server

Each domain must have one primary server and should have at least one secondary server to provide backup. "Zones" explains primary and secondary servers in detail.

### DNS Clients and the Resolver
To be a DNS client, a machine must run the resolver. The resolver is neither a daemon nor a single program; rather, it is a set of dynamic library routines used by applications that need to know machine names. The resolver's function is to resolve users' queries. To do that, it queries a name server, which then returns either the requested information or a referral to another server. Once the resolver is configured, a machine can request DNS service from a name server.

When a machine's /etc/nsswitch.conf file specifies hosts: dns (or any other variant that includes dns in the hosts line), the resolver libraries are automatically used. If the nsswitch.conf file specifies some other name service before dns, that name service is consulted first for host information and only if that name service does not find the host in question are the resolver libraries used.

For example, if the hosts line in the nsswitch.conf file specifies hosts: nisplus dns, the NIS+ name service will first be searched for host information. If the information is not found in NIS+, then the DNS resolver is used. Since name services such as NIS+ and NIS only contain information about hosts in their own network, the effect of a hosts:nisplus dns line in a switch file is to specify the use of NIS+ for local host information and DNS for information on remote hosts out on the Internet.

There are two kinds of DNS clients:

+ Client-only. A client-only DNS client does not run in.named; instead, it consults the resolver. The resolver knows about a list of name servers for the domain, to which queries are then directed.

+ Client-server. A client-server uses the services provided by in.named to resolve queries forwarded to it by client-machine resolvers.

### Introducing the DNS Namespace

The entire collection of DNS administrative domains throughout the world are organized in a hierarchy called the DNS namespace. This section shows how the namespace organization affects both local domains and the Internet.

#### DNS Namespace Hierarchy

Like the UNIX file system, DNS domains are organized as a set of descending branches similar to the roots of a tree. Each branch is a domain, each subbranch is a subdomain. The terms domain and subdomain are relative. A given domain is a subdomain relative to those domains above it in the hierarchy, and a parent domain to the subdomains below it.

![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2386.epsi.gif)
For example, in Figure 28-3, com is a parent domain to the Acme, Ajax, and AAA domains. Or you could just as easily say that those are subdomains relative to the com domain. In its turn, the Ajax domain is a parent to four subdomains (Sales, Manf, QA, and Corp).

A domain contains one parent (or top) domain plus the associated subdomains if any. Domains are named up the tree starting with the lowest (deepest) subdomain and ending with the root domain. For example, Mktg.Corp.Ajax.Com. from Figure 28-3.

### DNS Hierarchy in a Local Domain

If your company is large enough, it may support a number of domains,organized into a local namespace. Figure 28-4 shows a domain hierarchy that might be in place in a single company. The top-level, or "root" domain for the organization is ajax.com, which has three sub-domains, sales.ajax.com, test.ajax.com, and manf.ajax.com.

![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2387.epsi.gif)

DNS clients request service only from the servers that support their domain. If the domain's server does not have the information the client needs, it forwards the request to its parent server, which is the server in the next-higher domain in the hierarchy. If the request reaches the top-level server, the top-level server determines whether the domain is valid. If it is not valid, the server returns a "not found" type message to the client. If the domain is valid, the server routes the request down to the server that supports that domain.

### DNS Hierarchy and the Internet

The domain hierarchy shown in Figure 28-4 is, conceptually, a "leaf" of the huge DNS namespace supported on the global Internet.

The DNS namespace for the Internet is organized hierarchically as shown in Figure 28-5. It consists of the root directory, represented as a dot (.) and two top level domain hierarchies, one organizational and one geographical. Note that the com domain introduced in Figure 28-3 is one of a number of top-level organizational domains in existence on the Internet.

![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2388.epsi.gif)

At the present time, the organizational hierarchy divides its namespace into the top-level domains listed shown in Table 28-1. It is probable that additional top-level organizational domains will be added in the future.

| Domain | Purpose |
| ------ |:-------:|
| com	 | Commercial organizations |
| edu	 | Educational institutions |
| gov	 | Government institutions  |
| mil	 | Military groups 	    |
| net	 | Major network support centers |
| org	 | Nonprofit organizations and others  |
| int	 | International organizations |

The geographic hierarchy assigns each country in the world a two- or three-letter identifier and provides official names for the geographic regions within each country. For example, domains in Britain are subdomains of the uk top-level domain, Japanese domains are subdomains of jp, and so on.

### Joining the Internet

The Internet root domain, top-level domains (organizational and geographical) are maintained by the various Internet governing bodies. People with networks of any size can "join" the Internet by registering their domain name in either the organizational or the geographical hierarchy.

Every DNS domain must have a domain name. If your site wants to use DNS for name service without connecting to the Internet, you can use any name your organization wants for its your domains and subdomains, if applicable. However, if your site plans wants to join the Internet, it must register its domain name with the Internet governing bodies.

To join the Internet, you have to:
+ Register your DNS domain name with the an appropriate Internet governing body.
+ Obtain a network IP address from that governing body.

There are two ways to accomplish this:

+ You can communicate directly with the appropriate Internet governing body or their agent. In the United States, InterNIC is the company that currently handles network address and domain registration matters.

+ You can contract with an Internet Service Provider (ISP) to assist you. ISPs provide a wide range of services from consulting to actually hosting your Internet presence.

### Domain Names

Domain names indicate a domain's position in the overall DNS namespace, much as path names indicate a file's position in the UNIX file system. After your local domain is registered, its name is prepended to the name of the Internet hierarchy to which it belongs. For example, the ajax domain shown in Figure 28-4 has been registered as part of the Internet com hierarchy. Therefore, its Internet domain name becomes ajax.com.

Figure 28-6 shows the position of the ajax.com domain in the DNS namespace on the Internet.
![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2389.epsi.gif)

The ajax.com subdomains now have the following names.

+ sales.ajax.com
+ test.ajax.com
+ manf.ajax.com

DNS does not require domain names to be capitalized, though they may be. Here are some examples of machines and domain names:

+ Boss.manf.ajax.com
+ quota.Sales.ajax.com

The Internet organization regulates administration of its domains by granting each domain authority over the names of its hosts and by expecting each domain to delegate authority to the levels below it. Thus, the com domain has authority over the names of the hosts in its domain. It also authorizes the formation of the Ajax.com domain and delegates authority over the names in that domain. The Ajax.com domain, in turn, assigns names to the hosts in its domain and approves the formation of the Sales.Ajax.com, Test.Ajax.com, and Manf.Ajax.com domains.

### Fully-Qualified Domain Names

A domain name is said to be fully-qualified when it includes the names of every DNS domain from the local domain on up to ".", the DNS root domain. Conceptually, the fully-qualified domain name indicates the path to the root, as does the absolute path name of a UNIX file. However, fully-qualified domain names are read from lowest, on the left, to highest, on the right. Therefore, a fully-qualified domain name has the syntax:

![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2390.epsi.gif)

The fully qualified domain names for the ajax domain and its subdomains are:
+ ajax.com. 
+ sales.ajax.com 
+ test.ajax.com. 
+ manf.ajax.com

### Zones

DNS service for a domain is managed on the set of name servers first introduced "in.named and DNS Name Servers". Name servers can manage a single domain, or multiple domains, or domains and some or all of their corresponding subdomains. The part of the namespace that a given name server controls is called a zone; thus, the name server is said to be authoritative for the zone. If you are responsible for a particular name server, you may be given the title zone administrator.

The data in a name server's database are called zone files. One type of zone file stores IP addresses and host names. When someone attempts to connect to a remote host using a host name by a utility like ftp or telnet, DNS performs name-to-address mapping, by looking up the host name in the zone file and converting it into its IP address. 

![](https://docs.oracle.com/cd/E19455-01/806-1387/images/ad1intro.fig2391.epsi.gif)

For example, the Ajax domain shown in Figure 28-7 contains a top domain (Ajax), four subdomains, and five sub-subdomains. It is divided into four zones shown by the thick lines. Thus, the Ajax name server administers a zone composed of the Ajax, Sales, Retail, and Wholesale domains. The Manf and QA domains are zones unto themselves served by their own name servers, and the Corp name server manages a zone composed of the Corp, Actg, Finance, and Mktg domains.

### Reverse Mapping

The DNS database also include zone files that use the IP address as a key to find the host name of the machine, enabling IP address to host name resolution. This process is called reverse resolution or more commonly, reverse mapping. Reverse mapping is used primarily to verify the identity of the machine that sent a message or to authorize remote operations on a local host.

### The in-addr.arpa Domain

The in-addr.arpa domain is a conceptual part of the DNS namespace that uses IP addresses for its leaves, rather than domain names. It is the part of your zone that enables address-to-name mapping.

Just as DNS domain names are read with the lowest level subdomain occupying the furthest left position and the root at the far right, in-addr.arpa domain IP addresses are read from lowest level to the root. Thus, the IP addresses are read backward. For example, suppose a host has the IP address 192.200.21.165. In the in-addr.arpa zone files, its address is listed as 165.21.200.192.in-addr.arpa. with the dot at the end indicating the root of the in-addr.arpa domain.

### DNS Servers
http://www.damagehead.com/blog/2015/04/28/deploying-a-dns-server-using-docker/

```console
yanboyang713@boyang:~$ sudo netstat -pna | grep 53
[sudo] password for yanboyang713: 
tcp        0      0 172.17.0.1:53           0.0.0.0:*               LISTEN      1504/named          
tcp        0      0 172.18.0.1:53           0.0.0.0:*               LISTEN      1504/named          
tcp        0      0 192.168.1.1:53          0.0.0.0:*               LISTEN      1504/named          
tcp        0      0 10.172.1.51:53          0.0.0.0:*               LISTEN      1504/named          
tcp        0      0 127.0.0.1:53            0.0.0.0:*               LISTEN      1504/named          
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      1141/systemd-resolv 
tcp        0      0 127.0.0.1:953           0.0.0.0:*               LISTEN      1504/named          
tcp6       0      0 2404:f801:18:402::49883 2a01:111:f102:8001::443 ESTABLISHED 17794/537.36 --node 
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           845/avahi-daemon: r 
udp        0      0 172.17.0.1:53           0.0.0.0:*                           1504/named          
udp        0      0 172.18.0.1:53           0.0.0.0:*                           1504/named          
udp        0      0 192.168.1.1:53          0.0.0.0:*                           1504/named          
udp        0      0 10.172.1.51:53          0.0.0.0:*                           1504/named          
udp        0      0 127.0.0.1:53            0.0.0.0:*                           1504/named          
udp        0      0 127.0.0.53:53           0.0.0.0:*                           1141/systemd-resolv 
udp6       0      0 :::60590                :::*                                17794/537.36 --node 
udp6       0      0 :::5353                 :::*                                845/avahi-daemon: r 
udp6       0      0 :::42321                :::*                                17794/537.36 --node 
```
https://moss.sh/name-resolution-issue-systemd-resolved/

systemd-resolved
sudo service bind9 stop
sudo ip addr add 192.168.1.53/24 dev br0

docker run -d --name=bind --dns=127.0.0.1 \
  --publish=192.168.1.53:53:53/udp --publish=192.168.1.53:10001:10001 \
  --volume=/srv/docker/bind:/data \
  --env='ROOT_PASSWORD=SecretPassword' \
  sameersbn/bind:latest

execute an interactive bash shell on the container.
docker exec -it bind bash


```console
yanboyang713@boyang:~$ sudo systemctl status systemd-resolved
● systemd-resolved.service - Network Name Resolution
   Loaded: loaded (/lib/systemd/system/systemd-resolved.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2020-11-14 12:56:49 CST; 8h ago
     Docs: man:systemd-resolved.service(8)
           https://www.freedesktop.org/wiki/Software/systemd/resolved
           https://www.freedesktop.org/wiki/Software/systemd/writing-network-configuration-managers
           https://www.freedesktop.org/wiki/Software/systemd/writing-resolver-clients
 Main PID: 1141 (systemd-resolve)
   Status: "Processing requests..."
    Tasks: 1 (limit: 4915)
   CGroup: /system.slice/systemd-resolved.service
           └─1141 /lib/systemd/systemd-resolved

Nov 14 12:56:49 boyang systemd-resolved[1141]: . IN DS 19036 8 2 49aac11d7b6f6446702e54a1607371607a1a41855200fd2ce1cdde32f24e8fb5
Nov 14 12:56:49 boyang systemd-resolved[1141]: . IN DS 20326 8 2 e06d44b80b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Nov 14 12:56:49 boyang systemd-resolved[1141]: Negative trust anchors: 10.in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19.172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.ar
Nov 14 12:56:49 boyang systemd-resolved[1141]: Using system hostname 'boyang'.
Nov 14 12:56:49 boyang systemd[1]: Started Network Name Resolution.
Nov 14 15:39:22 boyang systemd-resolved[1141]: Grace period over, resuming full feature set (UDP+EDNS0) for DNS server 10.50.50.50.
Nov 14 16:03:27 boyang systemd-resolved[1141]: Grace period over, resuming full feature set (UDP+EDNS0) for DNS server 10.50.10.50.
Nov 14 17:32:02 boyang systemd-resolved[1141]: Server returned error NXDOMAIN, mitigating potential DNS violation DVE-2018-0001, retrying transaction with reduced feature level UDP.
Nov 14 17:32:02 boyang systemd-resolved[1141]: Server returned error NXDOMAIN, mitigating potential DNS violation DVE-2018-0001, retrying transaction with reduced feature level UDP.
Nov 14 17:44:01 boyang systemd-resolved[1141]: Grace period over, resuming full feature set (UDP+EDNS0) for DNS server 10.50.50.50.
```















DNS servers perform one or more functions:

1. Zone Master Servers. A master name server maintains all the data corresponding to the zone, making it the authority for that zone. Master servers are commonly called authoritative name servers. (See "Master Servers".)

The two types of master server are:

+ Zone primary master server. Each zone has one server that is designated as the primary master server for that zone. (See "Primary Master Server".)

+ Zone secondary master server. A zone can have one or more secondary master servers. Secondary master servers obtain their DNS data from the zone's primary master server. (See "Primary Master Server".)

2. Cache-only Server. All servers are caching servers in the sense that they maintain a cache of DNS data. A cache-only server is a server that is not a master server for any zone other than the in-addr.arpa. domain. (See "Caching and Cache-only Servers".)

3. Root Domain servers. A root domain server is the authoritative server for the top of your DNS domain hierarchy. If your network is connected to the Internet, your root domain servers are out on the Internet itself. If your network is not connected to the Internet, you must set up your own root domain server. (See "Root Domain Name Server".)

These different server functions can be performed by the same machine. For example, a machine can be a primary master server for one zone and a secondary master server for another zone. When this manual refers to a primary or secondary or cache-only server, it is not referring to a particular machine, but the role that machine plays for a given zone.

## Prerequisites

To complete this tutorial, you will need the following infrastructure. Create each server in the same datacenter with private networking enabled:

+ A fresh Ubuntu 18.04 server to serve as the Primary DNS server, ns1
+ (Recommended) A second Ubuntu 18.04 server to serve as a Secondary DNS server, ns2
+ Additional servers in the same datacenter that will be using your DNS servers

On each of these servers, configure administrative access via a sudo user and a firewall by following our Ubuntu 18.04 initial server setup guide.

### Example Infrastructure and Goals

For the purposes of this article, we will assume the following:

    We have two servers which will be designated as our DNS name servers. We will refer to these as ns1 and ns2 in this guide.
    We have two additional client servers that will be using the DNS infrastructure we create. We will call these host1 and host2 in this guide. You can add as many as you’d like for your infrastructure.
    All of these servers exist in the same datacenter. We will assume that this is the nyc3 datacenter.
    All of these servers have private networking enabled (and are on the 10.128.0.0/16 subnet. You will likely have to adjust this for your servers).
    All servers are connected to a project that runs on “example.com”. Since our DNS system will be entirely internal and private, you do not have to purchase a domain name. However, using a domain you own may help avoid conflicts with publicly routable domains.

With these assumptions, we decide that it makes sense to use a naming scheme that uses “nyc3.example.com” to refer to our private subnet or zone. Therefore, host1’s private Fully-Qualified Domain Name (FQDN) will be host1.nyc3.example.com. Refer to the following table the relevant details:

| Host | Role | Private FQDN | Private IP Address |
| ---- |:----:|:------------:|:------------------:|
| ns1  | Primary DNS Server | ns1.nyc3.example.com | 10.128.10.11 |
| ns2  | Secondary DNS Server | ns2.nyc3.example.com | 10.128.20.12 |
| host1 | Generic Host 1 | host1.nyc3.example.com | 10.128.100.101 |
| host2 | Generic Host 2 | host2.nyc3.example.com | 10.128.200.102 |

**Note**
Your existing setup will be different, but the example names and IP addresses will be used to demonstrate how to configure a DNS server to provide a functioning internal DNS. You should be able to easily adapt this setup to your own environment by replacing the host names and private IP addresses with your own. It is not necessary to use the region name of the datacenter in your naming scheme, but we use it here to denote that these hosts belong to a particular datacenter’s private network. If you utilize multiple datacenters, you can set up an internal DNS within each respective datacenter.

By the end of this tutorial, we will have a primary DNS server, ns1, and optionally a secondary DNS server, ns2, which will serve as a backup.

Let’s get started by installing our Primary DNS server, ns1.

## Installing BIND on DNS Servers

**Note**
Text that is highlighted in red is important! It will often be used to denote something that needs to be replaced with your own settings or that it should be modified or added to a configuration file. For example, if you see something like host1.nyc3.example.com, replace it with the FQDN of your own server. Likewise, if you see host1_private_IP, replace it with the private IP address of your own server.

Before starting the installation process, please ensure that your system is updated by executing the next three commands. On both DNS servers, ns1 and ns2, update the apt package cache by typing:

### Step 1- Update System
```console
sudo apt-get update 

sudo apt-get upgrade 

sudo apt-get dist-upgrade
```

### Step 2 – Install DNS package
Use the following command:
```bash
sudo apt-get install bind9 bind9utils bind9-doc
```

Once you execute the previous command it will suggest some other packages to be installed, press y to confirm downloading and installing those packages.

### Step 3 – Install DNS Utilities
Another useful package that will help you a lot in troubleshooting and testing the DNS issues is the dnsutils package that can be installed using the next command.

```bash
sudo apt-get install dnsutils
```
### Setting Bind to IPv4 Mode

Before continuing, let’s set BIND to IPv4 mode since our private networking uses IPv4 exclusively. On both servers, edit the bind9 default settings file by typing:

```bash
sudo vim /etc/default/bind9
```

Add “-4” to the end of the OPTIONS parameter. It should look like the following:
/etc/default/bind9

```
## run resolvconf?
RESOLVCONF=no

## startup options for the server

OPTIONS="-u bind -4"
```
Save and close the file when you are finished.

Restart BIND to implement the changes:

```bash
sudo systemctl restart bind9
```

Now that BIND is installed, let’s configure the primary DNS server.

### Configuring the Primary DNS Server

BIND’s configuration consists of multiple files, which are included from the main configuration file, named.conf. These filenames begin with named because that is the name of the process that BIND runs (short for “domain name daemon”). We will start with configuring the options file.

#### Configuring the Options File

On ns1, open the named.conf.options file for editing:

    sudo nano /etc/bind/named.conf.options

Above the existing options block, create a new ACL (access control list) block called “trusted”. This is where we will define a list of clients that we will allow recursive DNS queries from (i.e. your servers that are in the same datacenter as ns1). Using our example private IP addresses, we will add ns1, ns2, host1, and host2 to our list of trusted clients:
### Step 4 – DNS Configuration

Usually, you can find the DNS configuration files stored in /etc/bind directory. /etc/bind/named.conf is the master configuration file that contains the DNS options and it’s highly recommended that you should be careful while editing it.

### Step 5 – Configuring NameServer

The most used and default configuration is using your server as a caching server. This means that the DNS will get the answer to name queries, cache it and use the answer again when the domain is queried for another time. So, to use your server as a caching nameserver you can follow the next few steps.

Open and edit the /etc/bind/named.conf.options with your favorite editor.

sudo vi /etc/bind/named.conf.options

Add the following block to it, here we have used Google’s DNS.
forwarders {
8.8.8.8;
};

To enable the new configurations you should restart the DNS service.
```bash
sudo systemctl restart bind9
```
To test your query time we can use the dig command which is installed by the dnsutils package.

## TIPS
### Show you currently DNS
```console
yanboyang713@boyang:~$ cat /etc/resolv.conf
## This file is managed by man:systemd-resolved(8). Do not edit.
##
## This is a dynamic resolv.conf file for connecting local clients to the
## internal DNS stub resolver of systemd-resolved. This file lists all
## configured search domains.
##
## Run "systemd-resolve --status" to see details about the uplink DNS servers
## currently in use.
##
## Third party programs must not access this file directly, but only through the
## symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a different way,
## replace this symlink by a static file or a different symlink.
##
## See man:systemd-resolved.service(8) for details about the supported modes of
## operation for /etc/resolv.conf.

nameserver 127.0.0.53
options edns0
search corp.microsoft.com
```

