# Getting Statted with Overleaf


## Introduction {#introduction}

Overleaf is a collaborative cloud-based LaTeX editor used for writing, editing and publishing scientific documents.


## Using Git and GitHub {#using-git-and-github}

Overleaf offers **Git-Bridge** and **GitHub** Synchronization features that allow you to link your Overleaf projects with local Git repositories or synchronize them with Git repositories hosted on GitHub.

Overleaf **Git-Bridge** and **GitHub** Synchronization features allow you to work on your LaTeX source offline, help you to share with collaborators outside of Overleaf, and allow you to integrate Overleaf into more complex workflows.


### Overleaf GitHub Synchronization {#overleaf-github-synchronization}

The **GitHub** Synchronization feature allows you to link your Overleaf projects directly to a GitHub repository that acts as a remote repository for your Overleaf project, and provides a way to push and pull changes between them. GitHub synchronization can only be used on Github.com and cannot be used to connect to other GitHub enterprise installations.

You can synchronize an Overleaf project with a GitHub repository

-   Creating a new Overleaf project from an existing GitHub repository
-   Creating a new GitHub repository from an existing Overleaf project.

**NOTE**:

1.  It is not possible to synchronize an existing Overleaf project with an existing Github repository.

2.  If you just start a new project with Overleaf. I recommand create a Overleaf project with teamplate first. After you can creating a new GitHub repo from the existing Overleaf project.
3.  if you already done some work in GitHub Repo, such as coding. I recommand you creating a new Overleaf project from an existing GitHub repo.

For most of research, start a new research project. You could create a overleaf project first. There are Step-by-Step guide below for a researcher.


#### Step 1: Linking your Overleaf Account to your GitHub account {#step-1-linking-your-overleaf-account-to-your-github-account}

In order to use the GitHub Synchronization feature, you must link your Overleaf account to your Github account.

You can do this in your [Overleaf Account Settings](https://www.overleaf.com/user/settings).

Please note that the ability of Overleaf to connect to certain repositories or organizations associated with your account may depend on the permission settings that have been configured in GitHub.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1662405508/overleaf/overleaf-syn_zlp6ok.png" >}}


#### Step 2: Creating a new Overleaf project from a template {#step-2-creating-a-new-overleaf-project-from-a-template}

Using a template to start a new project will save you a lot of time. Overleaf provides a vast set of templates.

To create a document from a template, in the Project Management page click **New Project**, a drop-down menu will display, below Templates click on the document type you are about to write.

{{< figure src="https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/f/f3/V2newfromtemplate.png" >}}

You will be redirected to a list of templates where you can select one that is suitable. The gallery includes official templates from publishers, in some cases suitable for direct submission on Overleaf.

{{< figure src="https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/c/c7/V2galleryexample.png" >}}

Clicking on the template thumbnail will display some further information about the template, and you can start editing your own copy of the template on Overleaf right away by clicking 'Open as Template'.

{{< figure src="https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/5/5c/V2exampletemplate.png" >}}


#### Step 3: Creating a new GitHub repository from an Overleaf project {#step-3-creating-a-new-github-repository-from-an-overleaf-project}

From the Overleaf Project menu (Top right concern), you can select GitHub as one of the Synchronization options.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1662408405/overleaf/overleaf-menu_ttrgvz.png" >}}

{{< figure src="https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/4/49/Project_menu_github.png" >}}

This will provide you with a dialog where you can provide the name of a new GitHub repository to synchronize with your Overleaf project.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1662408634/overleaf/overleaf-export-to-github_jf3fey.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1662408771/overleaf/overleaf-push-github_nxup7m.png" >}}


#### Step 4: Synchronizing with GitHub {#step-4-synchronizing-with-github}

When you need to push changes to your GitHub repository from Overleaf or pull changes from GitHub into your project, click on the GitHub option in the Project menu.


### Creating a new Overleaf project from a GitHub repository {#creating-a-new-overleaf-project-from-a-github-repository}

From the New Project menu, you can select the GitHub option. This will present you with a list of repositories that are visible to Overleaf through your GitHub account, based on your GitHub permission settings.

{{< figure src="https://sharelatex-wiki-cdn-671420.c.cdn77.org/learn-scripts/images/2/2e/Create_new_github.png" >}}

Some things to note when creating a new Overleaf project from an existing GitHub repository.

-   There are size restrictions applied to Overleaf projects that may prevent larger GitHub repositories from being used to create a project.

    **NOTE**: Please see [this page](https://www.overleaf.com/learn/how-to/What_is_the_maximum_compilation_time,_file_number_and_project_size_allowed_on_free_vs_paid_plans%3F) for an overview of limitations applied to the size and number of files in an Overleaf project.

-   Overleaf projects do not support Git submodules or Git LFS.

