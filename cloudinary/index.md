# Take a Screenshot and upload to Cloudinary using Bash Scripts


## Introduction {#introduction}

In this article, I will introduce **HOW TO** take a screenshot and upload screenshot to **cloudinary**. Cloudinary will return the **image URL** and put it into your clipboard.

So, you can directly paste image URL using **Control+v**.

[Cloudinary](https://cloudinary.com/) is an amazing image hosting service. We can upload all of our **published** image to **WWW** and save our **local** disk memory. Let's we do it now!


## Pre-reading {#pre-reading}

1.  [Linux/Pipe to/from the clipboard in a Bash script]({{< relref "clipboard" >}})
2.  [Linux/Managing Your Dotfiles With Git and Make]({{< relref "dotfiles" >}})


## Pre-installion {#pre-installion}

1.  maim: take screenshots tool
2.  xclip: clipboard
3.  Python &gt;= 3.6 and PIP
4.  PIP install **cloudinary-cli**


## Cloudinary CLI {#cloudinary-cli}

The Cloudinary CLI (Command Line Interface) enables you to interact with Cloudinary through the command line. There are so many difference functions you can use. For example, you can perform Admin and Upload API operations. Additional helper commands are provided to help you to try out transformations, optimizations, and other common actions with minimal effort.

In our case, I will use cloudinary CLI combine others CLI command tools to automate take screenshot -&gt; upload to cloudinary -&gt; use **Control+v** paste image URL.


### Installation and configuration {#installation-and-configuration}

1.  **Prerequisite**: To use the Cloudinary CLI, you need Python 3.6 or later. Package Installer (pip) is installed with it.
2.  To install the Cloudinary CLI, run:

    ```bash
       pip install cloudinary-cli
    ```


#### Environment Variable {#environment-variable}

To make all your **cld** commands point to your Cloudinary account, you need set up your **CLOUDINARY\_URL** environment variable. We will do it in our bash script.

There are just a reminders, we will do it later. You can jump to [Linux/Take a Screenshot and upload to Cloudinary using Bash Scripts/Cloudinary CLI/Uploader Image Script](#uploader-image-script) section.

-   On Mac or Linux:

    ```bash
      export CLOUDINARY_URL=cloudinary://123456789012345:abcdefghijklmnopqrstuvwxyzA@cloud_name
    ```

-   On Windows:

    ```bash
      set CLOUDINARY_URL=cloudinary://123456789012345:abcdefghijklmnopqrstuvwxyzA@cloud_name
    ```

You may prefer to set up a persistent environment variable, but be aware that you could put your API secret at risk by storing it in your shell's startup script.

**Tip**: You can copy and paste your **API Environment variable** from the **Account Details** section of the **Dashboard** page in the [Cloudinary console](https://cloudinary.com/console).


#### Check your configuration {#check-your-configuration}

```bash
cld config
```

A response of the following form is returned:

```text
cloud_name:     <CLOUD_NAME>
api_key:        <API_KEY>
api_secret:     ***************<LAST_4_DIGITS>
private_cdn:    <True|False>
signature_algorithm:    <sha1|sha256>
```


### Uploader Image Script {#uploader-image-script}

This script include **Four** steps:

1.  Take a screenshot
2.  Set-up cloudinary environment and upload image to cloudinary
3.  Get image **URL**.
4.  Put **URL** into clipboard.

This **Script** could use **Make** to management, You can link this script to **$(HOME)/.local/bin/**

After, you can run screenshot directly.

```text
execs:
    $(LN) $(PWD)/scripts/screenshot $(HOME)/.local/bin/screenshot
```

The details: [Linux/Managing Your Dotfiles With Git and Make]({{< relref "dotfiles" >}})

```bash
#!/bin/bash
###############################################################
## AUTHOR Name: Boyang Yan                                   ##
## KEYWORDs: cloudinary, upload, screenshot                  ##
## PURPOSE: This program for take a screenshot and           ##
## upload to cloudinary                                      ##
## ENVIRONment: mac, Linux                                   ##
## COMMENTs:                                                 ##
## Last Modified Date: 05.01.2022                            ##
###############################################################

# Using scrot take a screenshot
fileName="$(date +'%Y-%m-%d-%H-%M-%S')-screenshot.png"
echo $fileName
scrot -s /tmp/$fileName

# Upload screenshot to cloudinary
export CLOUDINARY_URL=cloudinary://812134614995175:peTDZeQMd6IlCvr4-dLm5Xc0qBM@dkvj6mo4c
json=$(cld uploader upload "/tmp/$fileName" folder="screenshot" tags="screenshot" 2>&1)

# Save return json file to tmp dir
echo $json > /tmp/json.json

# Get image URL
url=$(jq -r '.url' /tmp/json.json)

# free files
rm -rf /tmp/json.json
rm -rf /tmp/$fileName

# Write URL to clipboard
echo $url
echo $url | xclip -selection c
```


## I3 WM Set-up {#i3-wm-set-up}

Set this on your i3 config file **~/.i3/config**

```text
## Screenshots
bindsym Print exec --no-startup-id maim "/home/$USER/Pictures/$(date)"
bindsym $mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) "/home/$USER/Pictures/$(date)"
bindsym Shift+Print exec --no-startup-id maim --select "/home/$USER/Pictures/$(date)"

## Clipboard Screenshots
bindsym Ctrl+Print exec --no-startup-id maim | xclip -selection clipboard -t image/png
bindsym Ctrl+$mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
bindsym Ctrl+Shift+Print exec --no-startup-id maim --select | xclip -selection clipboard -t image/png

## screenshots with cloudinary
bindsym --release Ctrl+Shift+p exec --no-startup-id screenshot
```

**NOTE:** You may remove the default screenshot shortcuts to prevent error.


### What it do {#what-it-do}

| Feature                    | Shortcut:              |
|----------------------------|------------------------|
| Full Screen                | PrtScrn                |
| Selection                  | Shift + PrtScrn        |
| Active Window              | Super + PrtScrn        |
| Clipboard Full Screen      | Ctrl + PrtScrn         |
| Clipboard Selection        | Ctrl + Shift + PrtScrn |
| Clipboard Active Window    | Ctrl + Super + PrtScrn |
| screenshot with cloudinary | Ctrl + Shift + p       |

All the screen shots are saved on ~/Pictures/CURRENT\_DATE

**NOTE**: super key is the windows key

