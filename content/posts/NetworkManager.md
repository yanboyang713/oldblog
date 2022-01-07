---
title: "Getting Started NetworkManager"
date: 2022-01-07T14:23:00+08:00
tags: ["NetworkManager"]
categories: ["Networking"]
draft: false
---

## Introduction {#introduction}

[NetworkManager](https://networkmanager.dev/) is the standard Linux network configuration tool suite. It supports large range of networking setups, from desktop to servers and mobile and integrates well with popular desktop environments and server configuration management tools.

It providing **detection** and **configuration** for systems to automatically connect to networks. NetworkManager's functionality can be useful for both **wireless** and **wired** networks.

-   For **wireless** networks, NetworkManager prefers known wireless networks and has the ability to switch to the most reliable network. NetworkManager-aware applications can switch from online and offline mode.
-   NetworkManager also prefers **wired** connections over wireless ones, has support for modem connections and certain types of VPN. NetworkManager was originally developed by Red Hat and now is hosted by the GNOME project.


## Installation and Basic Set-up {#installation-and-basic-set-up}


### Arch Linux {#arch-linux}

-   Installation
    NetworkManager can be installed with the package [networkmanager](https://archlinux.org/packages/?name=networkmanager), which contains a **daemon**, a command line interface (**nmcli**) and a curses‐based interface (**nmtui**).

<!--listend-->

```bash
yay -S networkmanager
```

-   Basic Set-up
    **Enable NetworkManager**:
    After installation, you should **start/enable** **NetworkManager.service**. Once the NetworkManager daemon is started, it will automatically connect to any available "system connections" that have already been configured. Any "user connections" or unconfigured connections will need nmcli or an applet to configure and connect.

    ```bash
      sudo systemctl start NetworkManager.service
      sudo systemctl enable NetworkManager.service
    ```

**Note**: You must ensure that no other service that wants to configure the network is running; in fact, multiple networking services will conflict. You can find a list of the currently running services with **systemctl --type=service** and then stop them.


## Usage {#usage}

**NetworkManager** comes with **nmcli** and **nmtui**.


### Show Device Status {#show-device-status}

-   See a list of network devices and their state:

    ```console
      [yanboyang713@manjaro] ➜ ~ nmcli device
      DEVICE               TYPE      STATE         CONNECTION
      enp5s0               ethernet  connected     DHCP
      wlp0s20f0u3          wifi      disconnected  --
      p2p-dev-wlp0s20f0u3  wifi-p2p  disconnected  --
      enp3s0f0             ethernet  unavailable   --
      enp3s0f1             ethernet  unavailable   --
      enp3s0f2             ethernet  unavailable   --
      enp3s0f3             ethernet  unavailable   --
      lo                   loopback  unmanaged     --
    ```

-   Disconnect an interface:

    ```bash
      nmcli device disconnect ifname eth0
    ```


### Profile {#profile}


#### Get a list of connections with their names, UUIDs, types and backing devices: {#get-a-list-of-connections-with-their-names-uuids-types-and-backing-devices}

```console
[yanboyang713@manjaro] ➜ ~ nmcli connection show
NAME    UUID                                  TYPE      DEVICE
DHCP    8791aeff-887d-3eb0-a5f6-60f12d0f8196  ethernet  enp5s0
feifei  80f700f5-9bc5-483b-bfb0-5941e48b6cde  wifi      wlp0s20f0u3
LEDE    1dedd26e-32b5-4941-b933-0ade69ee8c26  ethernet  --
ros     60808e22-2d48-437d-b8c3-6778fc3bfa6c  ethernet  --
```


#### Edit a connection {#edit-a-connection}

Here you can use the first column as connection-id used later. In this example we pick **ros** as a connection-id.

You have three methods to configure a connection **ros** after it has been created:

<!--list-separator-->

-  Connection file (recommend)

    In **_etc/NetworkManager/system-connections_**, modify the corresponding **ros.nmconnection** file.

    The connection profiles must be owned by root and have permissions 0600. Check the files owner and permissions with ls -l and fix it with chown and chmod.

    ```bash
    chmod 600 /etc/NetworkManager/system-connections/
    ```

    Do not forget to reload the configuration file with **nmcli connection reload**.

    NetworkManager clients (like nmcli) never look at these files directly. They usually don't run as root and wouldn't have the permissions to read/modify them. Instead, they use NetworkManager's D-Bus API.

    You are welcome to create connection profiles in the editor or pre-deploy them. That is, configuring files directly instead of using the D-Bus API is very much supported and what you try to do is fine.

    I suggest you use **Make** management all of your configurations. Please, have a check [Linux/Managing Your Dotfiles With Git and Make]({{< relref "dotfiles" >}}).

<!--list-separator-->

-  nmcli interactive editor

    ```bash
    nmcli connection edit 'ros'
    ```

    Usage is well documented from the editor.

<!--list-separator-->

-  nmcli command line interface

    ```bash
    nmcli connection modify 'ros' setting.property value
    ```

    For example you can change its IPv4 route metric to 200 using:

    ```bash
    nmcli connection modify 'ros' ipv4.route-metric 200
    ```


#### Activate a connection (i.e. connect to a network with an existing profile): {#activate-a-connection--i-dot-e-dot-connect-to-a-network-with-an-existing-profile}

```bash
nmcli connection up name_or_uuid
```


#### Delete a connection: {#delete-a-connection}

```bash
nmcli connection delete name_or_uuid
```


### nmcli WIFI examples {#nmcli-wifi-examples}

-   List nearby Wi-Fi networks:

    ```console
      [yanboyang713@manjaro] ➜ ~ nmcli device wifi list
      IN-USE  BSSID              SSID             MODE   CHAN  RATE        SIGNAL  BARS  SECURITY
              F4:DE:AF:05:DD:6C  CU_R6a7          Infra  9     130 Mbit/s  40      ▂▄__  WPA2
              FC:EC:DA:A1:54:B1  feifei           Infra  11    195 Mbit/s  40      ▂▄__  WPA2
              02:EC:DA:A1:54:B1  --               Infra  11    195 Mbit/s  39      ▂▄__  WPA2
    ```

-   Connect to a Wi-Fi network:

    ```console
      [yanboyang713@manjaro] ➜ ~ nmcli device wifi connect feifei password happyman
      Device 'wlp0s20f0u3' successfully activated with '80f700f5-9bc5-483b-bfb0-5941e48b6cde'.
    ```

    **NOTE**: feifei is my WIFI's SSID, you also can put your WIFI's BSSID, such as **FC:EC:DA:A1:54:B1**

-   Connect to a hidden Wi-Fi network:

    ```bash
      nmcli device wifi connect SSID_or_BSSID password password hidden yes
    ```

-   Connect to a Wi-Fi on the wlan1 interface:

    ```bash
      nmcli device wifi connect SSID_or_BSSID password password ifname wlan1 profile_name
    ```

    -   Turn off Wi-Fi:

        ```bash
            nmcli radio wifi off
        ```


## Reference List {#reference-list}

1.  <https://wiki.archlinux.org/title/NetworkManager>
2.  <https://networkmanager.dev/>
3.  <https://unix.stackexchange.com/questions/511557/networkmanager-doesnt-find-predefined-system-connections-files>
