# How to management patches in DWM


## Introduction {#introduction}

**DWM** only have less than 2000 lines of code. If you want to add more functionality for your **DWM** you need patches.

There are **two** types of patches:

1.  The ones that fit to your personal taste
2.  The ones you think should be included in mainline.

There are also have **TWO** patch methods.

1.  [Manual patches](#manual-patches)
2.  Using [DWM Flexipatch](#dwm-flexipatch) (recommend)


## Pre-reading {#pre-reading}

1.  [WM/Getting Started Dynamic Window Manager (DWM)]({{< relref "dwm" >}})


## Manual patches {#manual-patches}

patch filename format
The expected format for patches is:

For git revisions:

```text
toolname-patchname-YYYYMMDD-SHORTHASH.diff
dwm-allyourbase-20160617-3465bed.diff
```

The YYYYMMDD date should correspond to the last time the patch has been modified.


### diff generation {#diff-generation}

For git users:

```bash
cd program-directory
git add filechanges...
git commit (write a clear patch description)
git format-patch --stdout HEAD^ > toolname-patchname-YYYYMMDD-SHORTHASH.diff
```


### patch program {#patch-program}

For git users, use -3 to fix the conflict easily:

```bash
cd program-directory
git apply path/to/patch.diff
```

For patches formatted with git format-patch:

```bash
cd program-directory
git am path/to/patch.diff
```

For tarballs:

```bash
cd program-directory
patch -p1 < path/to/patch.diff
```

If faced the **ERROR** message like this:

```text
21 out of 41 hunks FAILED -- saving rejects to file dwm.c.rej
```

You should open file: **dwm.c.rej** and manual change file's contents. Good luck.


## DWM Flexipatch {#dwm-flexipatch}

1.  First Step: create a new **DIR** and clone **TWO** Repositories.
    1.  <https://github.com/bakkeby/dwm-flexipatch.git>
    2.  <https://github.com/bakkeby/flexipatch-finalizer.git>

        ```bash
              [yanboyang713@manjaro] ➜ Documents mkdir suckless
              [yanboyang713@manjaro] ➜ Documents cd suckless
              [yanboyang713@manjaro] ➜ suckless git clone https://github.com/bakkeby/dwm-flexipatch.git
              Cloning into 'dwm-flexipatch'...
              remote: Enumerating objects: 3533, done.
              remote: Counting objects: 100% (1297/1297), done.
              remote: Compressing objects: 100% (75/75), done.
              remote: Total 3533 (delta 1269), reused 1226 (delta 1222), pack-reused 2236
              Receiving objects: 100% (3533/3533), 774.86 KiB | 2.15 MiB/s, done.
              Resolving deltas: 100% (2625/2625), done.
              [yanboyang713@manjaro] ➜ suckless git clone https://github.com/bakkeby/flexipatch-finalizer.git
              Cloning into 'flexipatch-finalizer'...
              remote: Enumerating objects: 46, done.
              remote: Counting objects: 100% (46/46), done.
              remote: Compressing objects: 100% (33/33), done.
              remote: Total 46 (delta 27), reused 30 (delta 12), pack-reused 0
              Receiving objects: 100% (46/46), 9.64 KiB | 4.82 MiB/s, done.
              Resolving deltas: 100% (27/27), done.
        ```

2.  Test first

    ```bash
       cd dwm-flexipatch
       sudo make clean install
    ```

    If you have NOT face any **ERROR**, you can go to next **step**.
3.  Add Patches
    For example to include the alpha patch then you would only need to flip this setting from 0 to 1 in patches.h:

    ```text
       #define BAR_ALPHA_PATCH 1
    ```

Patches I use:

status_padding
attachaside
autostart
cyclelayouts
restartsig
rotatestack
statusallmons
tagothermonitors
vanity_gaps
status2d

**NOTE**:
dwm can now be restarted without destroying other X windows by pressing the usual Mod-Shift-Q combination.


## Reference List {#reference-list}

1.  <https://www.youtube.com/watch?v=9AoCHMIO5Ew>
2.  <https://github.com/bakkeby/dwm-flexipatch>
3.  <https://github.com/bakkeby/flexipatch-finalizer>

