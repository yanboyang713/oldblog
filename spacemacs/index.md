# Getting Started with Spacemacs

## installation

```bash
yay -S emacs
```

```bash
yay -S adobe-source-code-pro-fonts
```

clone spacemacs repo and use develop branch

```bash
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d -b develop
```

clone zilongshanren layer and checkout develop branch

```bash
git clone https://github.com/yanboyang713/spacemacs-private.git ~/.spacemacs.d/
```

```console
[yanboyang713@boyang ~]$ gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40
gpg: key 066DAFCB81E42C40: "GNU ELPA Signing Agent (2019) <elpasign@elpa.gnu.org>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1
```


## Spacemacs Config
Find the ~/.spacemacs file by pressing SPC f e d

## Creating a Spacemacs Layer
1. Create a new Spacemacs layer.
```bash
M-x configuration-layer/create-layer
```
2. Configuration layer path.
This will then give you the option of where to place the layer, but you can just use the default of **.spacemacs.d/layers/
3. Name of the layer.
4. Creating readme file or not.

