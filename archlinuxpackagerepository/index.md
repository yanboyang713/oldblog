# Getting Started Custom Arch Linux Package Repository with GitHub


## Introduction {#introduction}

I am making a Arch Linux based Meta Scientific Linux,so I need create a custom Package Repository for this OS packages.

In this article, I’m going to record my steps to create my own arch linux package repository, via github pages, no need to maintain your server.


## Build signed packages {#build-signed-packages}


### Create your gpg key {#create-your-gpg-key}

When you installed a package from AUR, you generally cloned a repo that contains a PKGBUILD file, then you executed makepkg to build this package. This is the minimalist steps to build a package, but by this way your package is not signed.

The goal of signing package is to guarantee that a package was created by the person that claims to have made it. Arch linux uses GnuPG to implement this feature, so let’s get start from GnuPG.

First of all, let’s create a gpg key:

```bash
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ gpg --full-generate-key
gpg (GnuPG) 2.2.32; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
  (14) Existing key from card
Your selection? 1
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (3072)
Requested keysize is 3072 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0)
Key does not expire at all
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: Boyang Yan
Email address: yanboyang713@gmail.com
Comment:
You selected this USER-ID:
    "Boyang Yan <yanboyang713@gmail.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: key 85FA48B5318C31E8 marked as ultimately trusted
gpg: directory '/home/yanboyang713/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/yanboyang713/.gnupg/openpgp-revocs.d/3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8.rev'
public and secret key created and signed.

pub   rsa3072 2022-03-20 [SC]
      3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8
uid                      Boyang Yan <yanboyang713@gmail.com>
sub   rsa3072 2022-03-20 [E]
```

Now you can use this command to check the key you just created:

```console
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ gpg --list-keys
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
/home/yanboyang713/.gnupg/pubring.kbx
-------------------------------------
pub   rsa3072 2022-03-20 [SC]
      3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8
uid           [ultimate] Boyang Yan <yanboyang713@gmail.com>
sub   rsa3072 2022-03-20 [E]
```

Here, you need to pay attention to two key points.

In the output of this command, **3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8** is your **key id**, and **yanboyang713@gmail.com** is your email.

**A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8** is the full key id which contains 40 characters, but sometimes we can use the last 16 characters to represent this key, i.e. **85FA48B5318C31E8**, this is the "short key".

We will use them later.

So we successfully created a gpg key. Next, let’s share it with others.

Generally, there are two methods to share your keys. One of them is to send your key to a key server, then people can download it from the Internet.

Let’s try to send your key to a key server first. It’s pretty easy, simplely execute this command:

```console
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ gpg --send-keys 3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8
gpg: sending key 85FA48B5318C31E8 to hkps://keyserver.ubuntu.com
```

If this command is executed successfully, other people can receive your key by running this command:

```bash
gpg --recv-keys 3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8
```

Or use the short key here:

```bash
gpg --recv-keys 85FA48B5318C31E8
```

Another method is to generate a key file and share it with others, then people can directly import your gpg key from this file.

To generate the key file, execute the following command:

```bash
gpg --output boyang.gpg --armor --export 3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8
```

Then we’ll get a key file named boyang.gpg.

To import this key, execute the following command:

```bash
gpg --import /path/to/boyang.gpg
```


### Configure pacman {#configure-pacman}

Now let’s configure pacman to use this gpg key.

Like gpg, there are also two methods for pacman to import a gpg key.

Mehod 1 is to receive it from key server:

```bash
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ sudo pacman-key --recv-keys 3A1A0AAF6F4C8495DDEF5A4785FA48B5318C31E8
[sudo] password for yanboyang713:
gpg: key 85FA48B5318C31E8: public key "Boyang Yan <yanboyang713@gmail.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1
```

Another method is to directly import this key from a key file:

```bash
sudo pacman-key --add /path/to/sainnhe.gpg
```

After importing this key, it’s recommended to verify the fingerprint:

```bash
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ sudo pacman-key --finger 85FA48B5318C31E8
pub   rsa3072 2022-03-20 [SC]
      3A1A 0AAF 6F4C 8495 DDEF  5A47 85FA 48B5 318C 31E8
uid           [ unknown] Boyang Yan <yanboyang713@gmail.com>
sub   rsa3072 2022-03-20 [E]
```

Finally, we need to locally sign the key:

```bash
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ sudo pacman-key --lsign-key 85FA48B5318C31E8
  -> Locally signed 1 keys.
==> Updating trust database...
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: public key CF66D153D884358F is 16 seconds newer than the signature
gpg: depth: 0  valid:   1  signed:  74  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: depth: 1  valid:  74  signed:  94  trust: 1-, 0q, 0n, 73m, 0f, 0u
gpg: depth: 2  valid:  85  signed:  31  trust: 85-, 0q, 0n, 0m, 0f, 0u
```

```bash
(base) [yanboyang713@Boyang-ThinkpadT470s] ➜ ~ sudo pacman-key --finger 85FA48B5318C31E8
pub   rsa3072 2022-03-20 [SC]
      3A1A 0AAF 6F4C 8495 DDEF  5A47 85FA 48B5 318C 31E8
uid           [  full  ] Boyang Yan <yanboyang713@gmail.com>
sub   rsa3072 2022-03-20 [E]
```

Configure makepkg
If you want to build packages signed with this key, you’ll also need to configure makepkg.

In your **/etc/makepkg.conf**, uncomment and modify the following lines:

```file
#-- Packager: name/email of the person or organization building packages
PACKAGER="Boyang Yan <yanboyang713@gmail.com>"
#-- Specify a key to use for package signing
GPGKEY="85FA48B5318C31E8"
```

Remember to change the PACKAGER field, too. This will determine the Packager section in your package.

Build signed packages
Now let’s try to build a signed package.

```bash
makepkg -sr --sign
```

The main difference between building signed packages and building unsigned packages is that you need to pass --sign argument to makepkg if you want to build signed packages.

And after building a signed package, we will get not only a \*.pkg.tar.zst, but also a \*.pkg.tar.zst.sig file. This \*.pkg.tar.zst.sig file is the binary signature of this package, we’ll need to add both of these two files to our package repository.


## Reference List {#reference-list}

1.  [Create Personal Arch Linux Package Repository via GitHub Pages](https://www.sainnhe.dev/post/create-personal-arch-linux-package-repository/)

