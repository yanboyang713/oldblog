---
title: "An introduction for Git"
date: 2021-09-24T06:11:32+10:00
tags: [ "git", "git-cli" ]
categories: [ "version contrl" ]
draft: false
---

## Git Cli

### Install

 If you facing this **ERROR** message (**bash: gh: command not found**), please following this [document](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) installing gh on your Linux first. Below section, I will tell you how to use Make to management your package.
```bash
sudo pacman -S github-cli
```

### Login
Step1:
```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into?  [Use arrows to move, type to filter]
> GitHub.com
  GitHub Enterprise Server
```

Step 2:
```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations?  [Use arrows to move, type to filter]
> HTTPS
  SSH
```

Step 3:
```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? (Y/n) Y
```

Step 4:
```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI?  [Use arrows to move, type to filter]
> Login with a web browser
  Paste an authentication token
```

Step 5:
```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser

! First copy your one-time code: 37E2-DE02
- Press Enter to open github.com in your browser... 
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1632490070/git/ghLogin_hgj913.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1632490251/git/ghAuthorize_ansrw3.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1632490331/git/ghAllDone_kia8xs.png)

```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser

! First copy your one-time code: 37E2-DE02
- Press Enter to open github.com in your browser... 
✓ Authentication complete. Press Enter to continue...

```

```console
[yanboyang713@Boyang-PC dotfiles]$ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser

! First copy your one-time code: 37E2-DE02
- Press Enter to open github.com in your browser... 
✓ Authentication complete. Press Enter to continue...

- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as yanboyang713
[yanboyang713@Boyang-PC dotfiles]$ 
```

### create a repository
```console
[yanboyang713@Boyang-PC dotfiles]$ gh repo create DotFiles
? Visibility  [Use arrows to move, type to filter]
> Public
  Private
  Internal
```

```console
[yanboyang713@Boyang-PC dotfiles]$ gh repo create DotFiles
? Visibility Public
? Would you like to add a .gitignore? (y/N) N
```

```console
[yanboyang713@Boyang-PC dotfiles]$ gh repo create DotFiles
? Visibility Public
? Would you like to add a .gitignore? No
? Would you like to add a license? (y/N) y
```

```console
[yanboyang713@Boyang-PC dotfiles]$ gh repo create DotFiles
? Visibility Public
? Would you like to add a .gitignore? No
? Would you like to add a license? Yes
? Choose a license  [Use arrows to move, type to filter]
  Eclipse Public License 2.0
  GNU General Public License v2.0
  GNU General Public License v3.0
  GNU Lesser General Public License v2.1
> MIT License
  Mozilla Public License 2.0
  The Unlicense
```

```console
[yanboyang713@Boyang-PC dotfiles]$ gh repo create DotFiles
? Visibility Public
? Would you like to add a .gitignore? No
? Would you like to add a license? Yes
? Choose a license MIT License
? This will add an "origin" git remote to your local repository. Continue? (Y/n) Y

```

```console
[yanboyang713@Boyang-PC dotfiles]$ gh repo create DotFiles
? Visibility Public
? Would you like to add a .gitignore? No
? Would you like to add a license? Yes
? Choose a license MIT License
? This will add an "origin" git remote to your local repository. Continue? Yes
✓ Created repository yanboyang713/DotFiles on GitHub
✓ Added remote https://github.com/yanboyang713/DotFiles.git
```

## Inviting collaborators
You can invite users to become collaborators to your personal repository.
1. Ask for the username of the person you're inviting as a collaborator. If they don't have a username yet, they can sign up for GitHub
2. On GitHub, navigate to the main page of the repository.
3. Under your repository name, click **Settings**.
![](https://docs.github.com/assets/images/help/repository/repo-actions-settings.png)
4. In the left sidebar, click **Manage access**.
![](https://docs.github.com/assets/images/help/repository/manage-access-tab.png)
5. Click **Invite a collaborator**.
![](https://docs.github.com/assets/images/help/repository/invite-a-collaborator-button.png)
6. In the search field, start typing the name of person you want to invite, then click a name in the list of matches.
![](https://docs.github.com/assets/images/help/repository/manage-access-invite-search-field-user.png)
7. Click **Add NAME to REPOSITORY**.
![](https://docs.github.com/assets/images/help/repository/add-collaborator-user-repo.png)
8. The user will receive an email inviting them to the repository. Once they accept your invitation, they will have collaborator access to your repository.

## Submodule
### add a submodule to a directory
git submodule add <git@github ...> dir
