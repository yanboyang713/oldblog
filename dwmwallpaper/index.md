# Change the Suckless DWM Wallpaper with Feh


## Introduction {#introduction}

By default DWM does NOT have a background and it does NOT have a background manager like you would find in Gnome or KDE or other full desktop environments.

DWM it is very easy to set a background using a small program called Feh. So, Let's we begin.


## Installation {#installation}

Firstly, we need to install **Feh**.

```bash
yay -S feh
```


## Usage {#usage}

```bash
feh --bg-fill Arch-Linux-blue-desktop-kiss-Linux-logo-nice-wallpaper-1657915.png
```

{{< figure src="http://res.cloudinary.com/dkvj6mo4c/image/upload/v1642240441/screenshot/xoa3ljqwmho0sumitox4.png" >}}

Now, it just updated my Wallpaper.

Automated at boot we just need to edit at the start of x.

Firstly, you need create a new bash script in your home DIR.

```sh
#!/bin/sh
feh --no-fehbg --bg-fill '/home/yanboyang713/DotFiles/wallpaper.png'
```

Than, edit your **.xinitrc** file, to run this script.

```text
# Set Background Wallpaper
~/.fehbg
```

When you update your Wallpaper, it will also update **~/.fehbg** here. You don't really need to go back and replace this DIR every time you change your wallpaper because the effect command will update this file here so you only need to really do it every time that you want to change your wallpaper so essentially just change whatever wallpaper you want to use and you're good that's it just make sure to edit **.xinitrc** the background set every time that you start x and you'll be good to go.

