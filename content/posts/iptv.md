---
title: "Getting Started IpTV with RouterOS and OpenVswitch"
date: 2021-12-13T19:52:00+08:00
tags: ["IPTV"]
categories: ["Networking"]
draft: false
---

After replacing the optical modem with the optical module, it is found that there are vlan 3964 and 4000, and there are igmp data on them, you can watch iptv through igmp proxy.

The specific operation method is as follows:

1.  Interface–>Add a VLAN virtual interface to the sfp optical port, with any Name and VLAN ID=4000. Not necessarily 4000 in other regions

{{< figure src="https://danteng.org/wp-content/uploads/2020/03/1584948032751.png" >}}

1.  Randomly configure an IP address for the VLAN4000 virtual interface. This address is not needed, but it must be present.
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032760.png)
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032766.png)
2.  An upstream interface is added to Routing–>IGMP Proxy, and VLAN 4000 virtual interface is selected here.
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032775.png)
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032780.png)
3.  Configure the internal network interface, be careful not to check upstream
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032784.png)
    After adding, you can see the multicast information in the MFC tag
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032788.png)
4.  Check IGMP Snooping in the Intranet bridge, General tab. The function is to allow IGMP frames to pass. If you do not check it, you will not be able to watch them.
    ![](https://danteng.org/wp-content/uploads/2020/03/1584948032792.png)
5.  Use a network cable to connect to the computer, it must be a network cable
6.  It can be watched by pot player or VLC under windows, and it can be watched by importing the Beijing Unicom multicast address table

    When watching iptv, you can see that traffic is generated on the VLAN 4000 virtual interface. According to observations, the standard-definition signal traffic is around 2.6M, and the high-definition signal is around 4M. My computer's network card is a 100M network card, and can only watch 4 channels of high-definition signals at the same time.

    {{< figure src="https://danteng.org/wp-content/uploads/2020/03/1584948032796.png" >}}

    If there is no IGMP Proxy option in the routing menu, please go to System->Packages to check whether the multicast package is installed.

    {{< figure src="https://danteng.org/wp-content/uploads/2020/03/1584948032800.png" >}}
