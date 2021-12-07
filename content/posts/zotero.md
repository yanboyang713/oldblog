---
title: "Getting Started with Zotero"
date: 2021-12-07T12:46:00+08:00
tags: ["zotero"]
categories: ["Research"]
draft: false
summary: "Set-up Zotero with Better Bibtex, zotfile and Scite."
---

## Introduction {#introduction}


## Why Use Zotero? {#why-use-zotero}

-   Be Organized: Keep all of your research and citations in one place
-   Save time: Format fewer citations by hand
-   Collaborate: Work with anyone in the world, anytime
-   It's Free: No cost even after you


## Zotero Installation {#zotero-installation}

```bash
yay -S zotero
```


## Launch Zotero :zotero-sync: {#launch-zotero-zotero-sync}


### Create a Zotero Account {#create-a-zotero-account}

If you haven’t already created a Zotero account, please take a few moments to register now [ **Here** ](https://www.zotero.org/user/register). It’s a free way to sync and access your library from anywhere, and it lets you join groups and back up all your attached files.


### Set up Zotero syncing {#set-up-zotero-syncing}

You can now set up Zotero syncing to sync your data across multiple computers, access your library online, or collaborate in group libraries. Follow these steps to get started.

1.  Open the Sync pane of the Zotero preferences

Goto "Edit" and click "Preferences"

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618958146/zotero/Wed%5FApr%5F21%5F08%5F33%5F25%5FAM%5FAEST%5F2021%5Fyoifbp.png" >}}

1.  Enter your username and password

Enter your username and password into the Sync preferences and click “Set Up Syncing”. Zotero will now automatically sync your data as you make changes.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618958273/zotero/Wed%5FApr%5F21%5F08%5F37%5F31%5FAM%5FAEST%5F2021%5Fon28w2.png" >}}


## Zotero Connector {#zotero-connector}

Go to this [link](https://chrome.google.com/webstore/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc).


## Better Bibtex :better-bibtex: {#better-bibtex-better-bibtex}


### Instaliion {#instaliion}

Install by downloading the [latest release](https://github.com/retorquere/zotero-better-bibtex/releases/tag/v5.4.29) and save the XPI file, just clicking it and then in Zotero:

1.  In the main menu go to Tools > Add-ons
2.  Select ‘Extensions’
3.  Click on the gear in the top-right corner and choose ‘Install Add-on From File…’
4.  Choose .xpi that you’ve just downloaded, click ‘Install’
5.  Restart Zotero


### Settings {#settings}

1.  Go to Edit -> Preferences -> Better BibTex


#### citation key format {#citation-key-format}

You can set key format gengeration the same format key with Google scholar

```file
[auth:lower][year][veryshorttitle:lower]
```

Zotero:
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631529034/zotero/citationKey%5F000%5Fgnoo2l.png)

Google Scholar:

```file
@article{jordan2015machine,
  title={Machine learning: Trends, perspectives, and prospects},
  author={Jordan, Michael I and Mitchell, Tom M},
  journal={Science},
  volume={349},
  number={6245},
  pages={255--260},
  year={2015},
  publisher={American Association for the Advancement of Science}
}
```


### Export {#export}

1.  In the main menu go to File > Export Library
2.  Format you can choose Better BibTex.

****Inportance Note****: Don't forget choose ****keep updated****
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631527429/zotero/export%5Filg1il.png)

1.  Choose folder

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631527595/zotero/exportFile%5Frtlngo.png" >}}

1.  There is a example:

    ```console
       [yanboyang713@Boyang-PC ~]$ head reference.bib

       @misc{ActionCommandsBasler,
         title = {Action {{Commands}} | {{Basler}}},
         howpublished = {https://docs.baslerweb.com/action-commands\#action-group-mask},
         file = {/home/yanboyang713/Zotero/storage/NKXFFZRJ/action-commands.html}
       }

       @misc{ActionCommandsBaslera,
         title = {Action {{Commands}} | {{Basler}}},
         howpublished = {https://docs.baslerweb.com/action-commands},
    ```


## Zotfile {#zotfile}

Install by downloading the [latest release](https://github.com/jlegewie/zotfile/releases/) and save the XPI file, just clicking it – and then in Zotero:

1.  In the main menu go to Tools > Add-ons
2.  Select ‘Extensions’
3.  Click on the gear in the top-right corner and choose ‘Install Add-on From File…’
4.  Choose .xpi that you’ve just downloaded, click ‘Install’
5.  Restart Zotero


### Settings {#settings}

1.  In the main menu go to Tools -> ZotFile Preferences


#### Location of Files {#location-of-files}

1.  Set ****Custom Location****. For example: /home/yanboyang713/papers
2.  Use subfolder defined by ****/%a****, mean author name.


#### Renaming Rules {#renaming-rules}

1.  Set **Format for all Item Types except Patents**: {%b}

This will rename file same with your Citation Key.

1.  Set **Maximum number of authors** choose 1
2.  Uncheck **Add suffix when authors are omitted**


## Scite {#scite}

Install by downloading the [latest release](https://github.com/scitedotai/scite-zotero-plugin/releases)  and save the XPI file, just clicking it – and then in Zotero:

1.  In the main menu go to Tools > Add-ons
2.  Select ‘Extensions’
3.  Click on the gear in the top-right corner and choose ‘Install Add-on From File…’
4.  Choose .xpi that you’ve just downloaded, click ‘Install’
5.  Restart Zotero


## Reference List {#reference-list}

1.  <http://zotfile.com/>
2.  <https://github.com/scitedotai/scite-zotero-plugin>
3.  <https://retorque.re/zotero-better-bibtex/>
