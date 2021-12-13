# Configuring Network Bonding


## Introduction {#introduction}

Network bonding refers to the combination of network interfaces on one host for redundancy and/or increased throughput.

Redundancy is the key factor:
we want to protect our virtualized environment from loss of service due to failure of a single physical link. This network bonding is the same as the Linux network bonding.

Using network bonding in **OpenVswitch OVS** require some switch configuration.

In this article, I will demonstrate How to use **Networking Bonding** between OVSBridge and Ubiquiti.

There are three modes of network bonding:

-   **Active-Passive**: there is one NIC active while another NIC is asleep. If the active NIC goes down, another NIC becomes active.
-   **Link Aggregation**: aggregated NICs act as one NIC which results in a higher throughput.
-   **Load Balanced**: the network traffic is equally balanced over the NICs of the machine.


## Ubiquiti bonding Set-up {#ubiquiti-bonding-set-up}

Steps for configure **Link Aggregation Groups**

1.  Navigate to the **Devices** section in the UniFi Network application and click on the switch to open the Properties Panel.
2.  In the Properties Panel, go to the **Ports** section and select a port that will participate in the link aggregation group by selecting Edit (pencil icon) when hovering over it.
3.  Click **Profile Overrides** to expand section.
4.  Under Operations, select **Aggregate**. This will expose some Aggregate options.
5.  Under the Aggregate Ports input which ports to include in the LAG.

<https://help.ui.com/hc/en-us/articles/360007279753-UniFi-USW-Configuring-Link-Aggregation-Groups-LAG>-


## OpenVswitch Bonding {#openvswitch-bonding}

<https://docs.openvswitch.org/en/latest/topics/bonding/>

