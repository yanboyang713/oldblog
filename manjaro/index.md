# Manjaro Linux Tips


## I3 WM

### Screenshot
#### Requirements
+ maim
```bash
yay -S xclip
```
+ xclip
```bash
yay -S maim
```

#### Set-up
Set this on your i3 config file ~/.i3/config

```file
## Screenshots
bindsym Print exec --no-startup-id maim "/home/$USER/Pictures/$(date)"
bindsym $mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) "/home/$USER/Pictures/$(date)"
bindsym Shift+Print exec --no-startup-id maim --select "/home/$USER/Pictures/$(date)"

### Clipboard Screenshots
bindsym Ctrl+Print exec --no-startup-id maim | xclip -selection clipboard -t image/png
bindsym Ctrl+$mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
bindsym Ctrl+Shift+Print exec --no-startup-id maim --select | xclip -selection clipboard -t image/png
```

**NOTE:** You may remove the default screenshot shortcuts to prevent error.

#### What it do
|        Feature	|       Shortcut:      |
|-----------------------|----------------------|
| Full Screen           |	PrtScrn        |
|Selection              |  Shift + PrtScrn     |
|     Active Window	|  Super + PrtScrn     |
| Clipboard Full Screen	|   Ctrl + PrtScrn     |
|  Clipboard Selection	|Ctrl + Shift + PrtScrn|
|Clipboard Active Window|Ctrl + Super + PrtScrn|

All the screen shots are saved on ~/Pictures/CURRENT_DATE

super key is the windows key


