# Managing Your Dotfiles With Git and Make


## Introduction
User-specific application configuration is traditionally stored in so called dotfiles (files whose filename starts with a dot). It is common practice to track dotfiles with a version control system such as Git to keep track of changes and synchronize dotfiles across various hosts.
There are various approaches to managing your dotfiles. In this article, I will talk about How to use Make with Git to management your dotfiles and package.

make - Unix, Linux Command is widely in used, so you can easier doing symlinking/copying/generating files.

## Creating a dotfiles repository
The advantage of using a versioning system for this, is that it’s easy to copy your changes to the other machines. As an extra, you can go back to a previous version in case you broke the configuration files, or you can share your awesome preferences with other developers.

1. Create a directory of your dotfiles and navigate to the root directory.
```bash
mkdir dotfiles
cd dotfiles/
```
2. Initialize the local directory as a Git repository.
```console
[yanboyang713@Boyang-PC dotfiles]$ git init -b main
Initialized empty Git repository in /home/yanboyang713/dotfiles/.git/
```

3. To create a repository for your project on GitHub, use the gh repo create subcommand. Replace project-name with the desired name for your repository. If you want your project to belong to an organization instead of to your user account, specify the organization name and project name with organization-name/project-name. Follow the interactive prompts.

```bash
gh repo create project-name
```

**NOTE:** If you facing any issue in this section, please have a look [this document]({{< ref "./git.md" >}}) first.

4. (Option) Pull changes from the new repository that you created. (If you created a .gitignore or LICENSE file in the previous step, this will pull those changes to your local directory.)
```console
[yanboyang713@Boyang-PC dotfiles]$ git pull --set-upstream origin main
From https://github.com/yanboyang713/DotFiles
 * branch            main       -> FETCH_HEAD
 ```
5. When you done your edit. Go ahead. Stage, commit, and push all of the files in your project.
```bash
git add . && git commit -m "initial commit" && git push
```

## Create a main Make File
```bash
touch Makefile
```

## Package Management

```file

```










