---
title: "Creating a Hugo blog"
date: 2020-02-05T06:11:32+10:00
tags: [ "Hugo", "Blog" ]
categories: [ "Blog" ]
---

## Installation Hugo
```bash
yay -S hugo
```

Step 1: Install Hugo
```bash
yay -S hugo
```

```bash
git clone https://github.com/yanboyang713/yanboyang713.github.io.git

## https://gohugo.io/commands/hugo_new_site/
hugo new site yanboyang713.github.io --force
```


Step 2: Create a New Site
```console
[yanboyang713@boyang ~]$ hugo new site blog
Congratulations! Your new Hugo site is created in /home/yanboyang713/blog.

Just a few more steps and you're ready to go:

1. Download a theme into the same-named folder.
   Choose a theme from https://themes.gohugo.io/ or
   create your own with the "hugo new theme <THEMENAME>" command.
2. Perhaps you want to add some content. You can add single files
   with "hugo new <SECTIONNAME>/<FILENAME>.<FORMAT>".
3. Start the built-in live server via "hugo server".
Visit https://gohugo.io/ for quickstart guide and full documentation.
```

Step 3: Add a Theme

```bash
cd blog

git init

git submodule add https://github.com/dillonzq/LoveIt.git themes/LoveIt
```

Step 4: Add Some Content
You can manually create content files (for example as content/<CATEGORY>/<FILE>.<FORMAT>) and provide metadata in them, however you can use the new command to do a few things for you (like add title and date):

```bash
hugo new posts/my-first-post.md
```

Step 5: Start the Hugo server 
Now, start the Hugo server with drafts enabled:

```

Build Hugo With GitHub Action

Add ssh deploy key
Generate your deploy key with the following command.

```bash
ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -f gh-pages -N ""
```

Next, Go to Repository Settings

Go to Deploy Keys and add your public key with the Allow write access
Go to Secrets and add your private key as ACTIONS_DEPLOY_KEY


## Set up your Google Analytics account
Head over to https://analytics.google.com/ and make an account (or sign in with your Google account).

Set up your “Property”, give it a name, and point it to the URL of the site you plan on tracking.

Click through the basic options until you land on a page with a Tracking Code. This is the value we need to be keeping track of.
If you’re having trouble with this step then I recommend checking out [this](http://cloudywithachanceofdevops.com/posts/2018/05/17/setting-up-google-analytics-on-hugo/) tutorial, which has very detailed step by step instructions for configuring your GA account.

### Configuring Hugo
Hugo has a built in template for Google Analytics. All we need to do is make sure the template gets included in all our pages, so we can have more detailed tracking.

### header.html
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

```
googleAnalytics = "UA-302012394-1"
```

Replacing the string with your Google Analytics tracking code. After you rebuild the site, everything should work as expected! You should also be able to detect the traffic by running the server locally as well, before you push to production.

Note!
I had quite the time figuring out why I couldn’t see any activity on my site. Being the paranoid privacy nut that I am, I have a multitude of tracker/script blocker plugins on my browsers, to block nefarious ads/scripts.

This also blocks the tracking I do want, wouldn’t you know. I switched over to a private window without plugins and the traffic was instantly visible!

