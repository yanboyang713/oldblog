# Getting Started Rofi


## Introduction {#introduction}

**Rofi** is a window switcher, run dialog, ssh-launcher and dmenu replacement that started as a clone of simpleswitcher.


## Installation {#installation}

1.  First, Make sure you have the same (stable) version of rofi installed.
    -   On Arch / Arch-based:

        ```bash
             pacman -S rofi
        ```

2.  On Debian / Ubuntu:

    ```bash
       apt-get install rofi
    ```

3.  On Fedora:

<!--listend-->

```bash
dnf install rofi
```

1.  Clone this repository

    ```bash
       git clone --depth=1 https://github.com/adi1090x/rofi.git
    ```

2.  Change to cloned directory and make setup.sh executable

    ```bash
       cd rofi
       chmod +x setup.sh
    ```
3.  Run setup.sh and select your screen resolution

    ```console
       $ ./setup.sh

       [*] Installing Rofi Themes...

       [*] Choose your screen resolution -
       [1] 1920x1080
       [2] 1366x768

       [?] Select Option : 1

       [*] Installing fonts...
       [*] Creating a backup of your rofi configs...
       [*] Successfully Installed.
    ```

That's it, These themes are now installed on your system.


## i3WM {#i3wm}

'bindsym $mod+d exec --no-startup-id rofi -show drun -show-icons


## DWM {#dwm}


## Reference List {#reference-list}

1.  <https://www.reddit.com/r/suckless/comments/gs7fjz/how_do_i_add_rofi_show_drun_showicons_to_dwm/>
2.  <https://github.com/adi1090x/rofi>

