# Creating a Hugo blog


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




