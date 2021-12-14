# Creating a Hugo blog


## Overview {#overview}

This is a tutorial on creating a blog or website using [hugo](https://gohugo.io/) (a static site generator).

We will use Docker as our development environment. Also, we will storge our Hugo development code in Github main branche and automate the whole process with Github Action Workflow for Github Pages.


## Prerequisites {#prerequisites}

You will need to have the following:

1.  Docker installation. Docker is available for Mac/Windows/Linux and is easily installed. You can following the link at the below for install Docker.
    link "content/posts/dockerinstall.md" install Docker "go!"
2.  Domain Name (optional). I will be using a domain name for my configuration. If you wish to follow along fully, you’ll need a domain name but, you can just as easily stick with the free subdomain provided by Github pages, i.e. name.github.io, and skip the domain name related aspects in this tutorial. If you don’t have a domain name but wish to purchase one, [namecheap](https://www.namecheap.com/) is an excellent provider and fits in well with this tutorial.
3.  Github account, sign up for free on github.com

In the subsequent sections, we will be covering the complete setup of <https://yanboyang.com>


## Set-up {#set-up}


### On Github, create a repository called something.github.io {#on-github-create-a-repository-called-something-dot-github-dot-io}

In my case, I created yanboyang.github.io
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608974742/hexo/Sat%5FDec%5F26%5F05%5F24%5F25%5FPM%5FCST%5F2020%5Fzbblkc.png)


### Clone this repository to Local {#clone-this-repository-to-local}

```console
[yanboyang713@boyang Documents]$ git clone https://github.com/yanboyang713/yanboyang.github.io.git
Cloning into 'yanboyang.github.io'...
remote: Enumerating objects: 760, done.
remote: Counting objects: 100% (760/760), done.
remote: Compressing objects: 100% (148/148), done.
remote: Total 760 (delta 289), reused 743 (delta 276), pack-reused 0
Receiving objects: 100% (760/760), 4.13 MiB | 1.88 MiB/s, done.
Resolving deltas: 100% (289/289), done.
```

```bash
# Go to your blog root folder
cd yanboyang.github.io
```


### Create a new Hugo site {#create-a-new-hugo-site}

```bash
docker run --rm -it \
  -v $(pwd):/src \
  -w="/src" \
  klakegg/hugo:latest \
  "new site . --force"
```


### Chown User and Group Recursively {#chown-user-and-group-recursively}

```bash
sudo chown -R yanboyang713:yanboyang713 .
```


### Add the theme to your blog {#add-the-theme-to-your-blog}

```bash
git submodule add https://github.com/sunt-programator/CodeIT.git themes/CodeIT
```


### Basic Configuration {#basic-configuration}

The following is a basic configuration for the CodeIT theme:

```toml
baseURL = "http://example.org/"
# [en, zh-cn, fr, ...] determines default content language
defaultContentLanguage = "en"
# language code
languageCode = "en"
title = "My New Hugo Site"

# Change the default theme to be use when building the site with Hugo
theme = "CodeIT"

[params]
  # DoIt theme version
  version = "0.2.X"

[menu]
  [[menu.main]]
    identifier = "posts"
    # you can add extra information before the name (HTML format is supported), such as icons
    pre = ""
    # you can add extra information after the name (HTML format is supported), such as icons
    post = ""
    name = "Posts"
    url = "/posts/"
    # title will be shown when you hover on this menu link
    title = ""
    weight = 1
  [[menu.main]]
    identifier = "tags"
    pre = ""
    post = ""
    name = "Tags"
    url = "/tags/"
    title = ""
    weight = 2
  [[menu.main]]
    identifier = "categories"
    pre = ""
    post = ""
    name = "Categories"
    url = "/categories/"
    title = ""
    weight = 3

# Markup related configuration in Hugo
[markup]
  # Syntax Highlighting (https://gohugo.io/content-management/syntax-highlighting)
  [markup.highlight]
    # false is a necessary configuration (https://github.com/dillonzq/LoveIt/issues/158)
    noClasses = false
```


### Create Your First Post {#create-your-first-post}

Here is the way to create your first post:

```bash
docker run --rm -it \
  -v $(pwd):/src \
  -w="/src" \
  klakegg/hugo:latest \
  "new posts/first_post.md"

sudo chown -R yanboyang713:yanboyang713 content
```

**NOTE:** Go to your first post and change the **draft: false**


### Launching the Website in Docker {#launching-the-website-in-docker}

```bash
docker run --rm -it \
  -v $(pwd):/src \
  -p 1313:1313 \
  klakegg/hugo:latest \
  server
```

Web Server is available at <http://localhost:1313/>


### Build Hugo With GitHub Action {#build-hugo-with-github-action}

```bash
mkdir -p .github/workflows
vim .github/workflows/main.yml
```

```yml
name: github pages

on:
  push:
    branches:
      - main  # Set a branch to deploy

jobs:
  deploy:
    runs-on: ubuntu-18.04
    steps:
      - name: Git checkout
        uses: actions/checkout@v2
        with:
          submodules: true  # Fetch Hugo themes (true OR recursive)
          fetch-depth: 0    # Fetch all history for .GitInfo and .Lastmod

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          personal_token: ${{ secrets.TOKEN }}
          external_repository: yanboyang713/yanboyang713.github.io
          publish_dir: ./public
          publish_branch: gh-pages
          keep_files: true
          user_name: yanboyang713
          user_email: yanboyang713@gmail.com
          cname: yanboyang.com
```


## Post your blog {#post-your-blog}

I written a bash script for push your blog to Github evertime.

**NOTE:** If you need add your public key.

1.  Go to Repository Settings
2.  Go to Deploy Keys and add your public key with the Allow write access

<!--listend-->

```bash
#!/bin/bash
###############################################################
## AUTHOR Name: Boyang Yan                                   ##
## KEYWORDs: Hugo Depolyment                                 ##
## PURPOSE: This program for push Hugo to github             ##
## ENVIRONment: mac, Linux                                   ##
## COMMENTs:                                                 ##
## Last Modified Date: 25.05.2021                            ##
###############################################################

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

deploy () {

    echo "$1"

    # get Repositorie Name
    RepositorieName=$(grep -oP '(?<=[[:space:]]).*?(?=!)' <<< "$1")

    echo "Your Github Repositorir Name is: $RepositorieName"

    #set git remote URL
    git remote set-url origin git@github.com:"$RepositorieName".git

    # Add changes to git.
    git add -A

    # Commit changes.
    msg="Published on $(date +'%Y-%m-%d %H:%M:%S')"

    echo "$msg"
    git commit -m "$msg"

    # Push source and build repos.
    git push

}

initSSHkey () {
    echo "***** App .ssh directory is empty, initialising ssh key and configuring known_hosts for common git repositories (github/gitlab) *****"
    rm -rf ~/.ssh/*
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
    ssh-keyscan github.com > ~/.ssh/known_hosts 2>/dev/null
    ssh-keyscan gitlab.com >> ~/.ssh/known_hosts 2>/dev/null

    echo "Init SSH key Done!!!"
}

testConnectionAndDeploy () {
    # Testing Github connection success or not
    testConnection=$(ssh -T git@github.com 2>&1)

    # success connect to Github
    if [[ $testConnection =~ successfully ]]; then
        echo "***** You can connect to Github successfully **********"
        deploy "$testConnection"
    else
        echo "***** Could NOT connect to Github!!! Please, update your Github deploy keys *******"
        echo "***** You can add the below public key as your deploy key *****"
        cat ~/.ssh/id_rsa.pub

        read -p "Are you done update your deploy key (Y/n)? " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            testConnection=$(ssh -T git@github.com 2>&1)
            if [[ $testConnection =~ successfully ]]; then
                deploy "$testConnection"
            else
                echo "Please wait a few minutes, and try again !!!"
            fi
        fi
    fi
}


# Have ssh key
if [ "$(ls -A ~/.ssh 2>/dev/null)" ]; then
    echo "***** .ssh directory exists and has content, continuing *****";
    testConnectionAndDeploy
# Have NOT ssh key
else
    initSSHkey
    testConnectionAndDeploy

fi;
```


## Set up your Google Analytics account {#set-up-your-google-analytics-account}

Head over to <https://analytics.google.com/> and make an account (or sign in with your Google account).

Set up your “Property”, give it a name, and point it to the URL of the site you plan on tracking.

Click through the basic options until you land on a page with a Tracking Code. This is the value we need to be keeping track of.
If you’re having trouble with this step then I recommend checking out [this](http://cloudywithachanceofdevops.com/posts/2018/05/17/setting-up-google-analytics-on-hugo/) tutorial, which has very detailed step by step instructions for configuring your GA account.


### Configuring Hugo {#configuring-hugo}

Hugo has a built in template for Google Analytics. All we need to do is make sure the template gets included in all our pages, so we can have more detailed tracking.


### header.html {#header-dot-html}

The easiest way to do this is to insert the template into the header.html file used by your Hugo theme of choice.

Since it is common to use a git submodule as a theme directory, it could be undesirable and messy to write changes directly into the submodule.

The solution to this is to create another directory layouts in the root of your hugo directory. Hugo looks at the contents of this folder and uses it to overwrites the styles defined by your theme.

For example I use the Terminal theme. The header file is located at <HUGO ROOT>/themes/terminal/layouts/partials/header.html

We can copy this file to our new directory, so it sits at <HUGO ROOT>/layouts/partials/header.html.

Next we can edit our header.html file to include the template for google analytics. Your header.html will look different depending on the theme you’re using, but there should be a <head> section at the top. If not we can simply create it.

```html
<head>
  {{ template "_internal/google_analytics.html" . }}
  {{ template "_internal/google_analytics_async.html" . }}
</head>
```

Adding these two lines inside <head> will make the google tracking code embed in the HTML of all of your pages.

config.toml
Finally we need to use that tracking code from earlier. At the top level of your config.toml, add the line

```toml
googleAnalytics = "UA-302012394-1"
```

Replacing the string with your Google Analytics tracking code. After you rebuild the site, everything should work as expected! You should also be able to detect the traffic by running the server locally as well, before you push to production.

Note!
I had quite the time figuring out why I couldn’t see any activity on my site. Being the paranoid privacy nut that I am, I have a multitude of tracker/script blocker plugins on my browsers, to block nefarious ads/scripts.

This also blocks the tracking I do want, wouldn’t you know. I switched over to a private window without plugins and the traffic was instantly visible!


## Write Blog with Emacs and ox-hugo package {#write-blog-with-emacs-and-ox-hugo-package}

[ox-hugo](https://ox-hugo.scripter.co/) is an awesome way to blog from org-mode. It makes it possible for posts in org-mode format to kept separate, and it generates the Markdown files for Hugo. Hugo supports org files, but using ox-hugo has multiple advantages:

-   Parsing is done by org-mode natively, not by an external library. Although goorgeous (used by Hugo) is very good, it still lacks in many areas, which leads to text being interpreted differently as by org-mode.
-   Hugo is left to parse a native Markdown file, which means that many of its features such as shortcodes, TOC generation, etc., can still be used on the generated file.


### Prerequisites {#prerequisites}

Currently, I am using Doom Emacs, which includes and configures ox-hugo as part of its **(:lang org +hugo)** module, so all that’s left is to configure some parameters to my liking.

I set org-hugo-use-code-for-kbd so that I can apply a custom style to keyboard bindings in my blog.

```emacs-lisp
(after! ox-hugo
  (setq org-hugo-use-code-for-kbd t))
```


### Auto-export the whole project on Saving {#auto-export-the-whole-project-on-saving}


#### Step 1: Enable minor mode org-hugo-auto-export-mode {#step-1-enable-minor-mode-org-hugo-auto-export-mode}

This minor mode is disabled by default. It can be enabled separately at project level or file level.

**Note** that once you update the .dir-locals.el file or file-local Variables as shown below, you will be prompted by Emacs to tell it if those settings are safe. Hit ! in that prompt to says yes and to save that choice for future Emacs sessions.


#### Step 2: Enable for the whole project {#step-2-enable-for-the-whole-project}

If you want to enable auto-exporting for the whole project, add this to the **.dir-locals.el** file in the project root:

```emascs-lisp
(("content-org/"
  . ((org-mode . ((eval . (org-hugo-auto-export-mode)))))))
```

Above assumes that the Org files are in the “content-org"/ directory (at any nested level in there) relative to that .dir-locals.el file:

```file
<HUGO_BASE_DIR>
  ├── config.toml
  ├── content
  ├── content-org      <-- Org files in there
  ├── static
  ├── themes
  └── .dir-locals.el
```


#### Step 3: Create a post with org mode {#step-3-create-a-post-with-org-mode}

In content-org directory, create a xxx.org file.

```org

#+title: Boyang Yan's Blog
#+hugo_base_dir: ~/blog/
#+hugo_section: posts
#+hugo_front_matter_format: yaml

*Emacs :@Emacs:
**DONE Getting Started with Doom Emacs
CLOSED: [2021-10-05 Tue 03:44]
:PROPERTIES:
:EXPORT_FILE_NAME: doom
:EXPORT_OPTIONS: author:nil
:END:
***Prerequisites
****Instation Dependencies
#### Arch Linux
#+begin_src bash
# required dependencies
pacman -S git emacs ripgrep
# optional dependencies
pacman -S fd
yay -S emacs-pdf-tools-git
```

\#+end\_src

When you save this file, you will found there are doom file created in your blog->content->posts automately.


### Export bindings {#export-bindings}

The common ox-hugo export bindings are:


#### For both one-post-per-subtree and one-post-per-file flows {#for-both-one-post-per-subtree-and-one-post-per-file-flows}

-   **C-c C-e H H**
    Export “What I Mean”.
    If point is in a valid Hugo post subtree, export that subtree to a Hugo post in Markdown.
    A valid Hugo post subtree is an Org subtree that has the **EXPORT\_FILE\_NAME** property set.
    If the file is intended to be exported as a whole (i.e. has the #+title keyword), export the whole Org file to a Hugo post in Markdown.

-   **C-c C-e H A**
    Export all “What I Mean”
    If the Org file has one or more ‘valid Hugo post subtrees’, export them to Hugo posts in Markdown.
    If the file is intended to be exported as a whole (i.e. no ‘valid Hugo post subtrees’ at all, and has the **#+title** keyword), export the whole Org file to a Hugo post in Markdown.


#### For only the one-post-per-file flow {#for-only-the-one-post-per-file-flow}

-   **C-c C-e H h**
    Export the Org file to a Hugo post in Markdown.

