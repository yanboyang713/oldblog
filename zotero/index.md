# Getting Started with Zotero

## Introduction

## Why Use Zotero?
+ Be Organized: Keep all of your research and citations in one place
+ Save time: Format fewer citations by hand
+ Collaborate: Work with anyone in the world, anytime 
+ It's Free: No cost even after you

## Zotero Installation

```bash
yay -S zotero
```

## Launch Zotero

### Create a Zotero Account
If you haven’t already created a Zotero account, please take a few moments to register now [**Here**](https://www.zotero.org/user/register). It’s a free way to sync and access your library from anywhere, and it lets you join groups and back up all your attached files.

### Set up Zotero syncing
You can now set up Zotero syncing to sync your data across multiple computers, access your library online, or collaborate in group libraries. Follow these steps to get started.

1. Open the Sync pane of the Zotero preferences
Goto "Edit" and click "Preferences"

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618958146/zotero/Wed_Apr_21_08_33_25_AM_AEST_2021_yoifbp.png)

2. Enter your username and password
Enter your username and password into the Sync preferences and click “Set Up Syncing”. Zotero will now automatically sync your data as you make changes.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618958273/zotero/Wed_Apr_21_08_37_31_AM_AEST_2021_on28w2.png)

## Zotero Connector
https://chrome.google.com/webstore/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc

## Better Bibtex

### Instaliion
Install by downloading the [latest release](https://github.com/retorquere/zotero-better-bibtex/releases/tag/v5.4.29) and save the XPI file, just clicking it – and then in Zotero:

1. In the main menu go to Tools > Add-ons
2. Select ‘Extensions’
3. Click on the gear in the top-right corner and choose ‘Install Add-on From File…’
4. Choose .xpi that you’ve just downloaded, click ‘Install’
5. Restart Zotero

### Settings
1. Go to Edit -> Preferences -> Better BibTex

#### citation key format
You can set key format gengeration the same format key with Google scholar
```file
[auth:lower][year][veryshorttitle:lower]
```

Zotero:
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631529034/zotero/citationKey_000_gnoo2l.png)

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

### Export
1. In the main menu go to File > Export Library
2. Format you can choose Better BibTex.
**Inportance Note**: Don't forget choose **keep updated**
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631527429/zotero/export_ilg1il.png)
3. Choose folder
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1631527595/zotero/exportFile_rtlngo.png)
4.  There is a example:
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

## Zotfile
Install by downloading the [latest release](https://github.com/jlegewie/zotfile/releases/)  and save the XPI file, just clicking it – and then in Zotero:

1. In the main menu go to Tools > Add-ons
2. Select ‘Extensions’
3. Click on the gear in the top-right corner and choose ‘Install Add-on From File…’
4. Choose .xpi that you’ve just downloaded, click ‘Install’
5. Restart Zotero

### Settings
1. In the main menu go to Tools -> ZotFile Preferences

#### Location of Files
1. Set **Custom Location**. For example: /home/yanboyang713/papers
2. Use subfolder defined by **/%a**, mean author name.

#### Renaming Rules
1. Set **Format for all Item Types except Patents**: {%b}
This will rename file same with your Citation Key.
2. Set **Maximum number of authors** choose 1
3. Uncheck **Add suffix when authors are omitted**

## Scite


Install by downloading the [latest release](https://github.com/scitedotai/scite-zotero-plugin/releases)  and save the XPI file, just clicking it – and then in Zotero:

1. In the main menu go to Tools > Add-ons
2. Select ‘Extensions’
3. Click on the gear in the top-right corner and choose ‘Install Add-on From File…’
4. Choose .xpi that you’ve just downloaded, click ‘Install’
5. Restart Zotero

## Reference List
1. http://zotfile.com/
2. https://github.com/scitedotai/scite-zotero-plugin
3. https://retorque.re/zotero-better-bibtex/








