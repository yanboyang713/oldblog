# Github Action Push To Another Repository


## Overview {#overview}

Using Github Action push to another Repository is common in used.

There are two ways to set up this GitHub action:

-   Using SSH deploy keys (recommended, a bit harder to set up): push-to-another-repository-deploy-keys-example. The configuration is in the file ci.yml (ssh keys).

-   Using a Personal Access Token (first iteration, not recommended but easier to set up: push-to-another-repository-example. The configuration is in the file ci.yml (token).


## Setup using the Personal Access Token {#setup-using-the-personal-access-token}

This method is here for compatibility with the initial approach of this GitHub Action.
The Personal Access Token would have access to all your repositories, so if it were to be leaked, the damage would be greater: it would allow pushes to the same repositories to which the Personal Access Token owner has access, and other possible associated permissions. On the other hand, the setup is a bit easier because it does not involve creating the deploy key.

Generate your Personal Access Token using the following steps:

1.  Go to the general GitHub Settings (on the right-hand side on the profile picture)
    ![](https://cpina.github.io/push-to-another-repository-docs/_images/pat-10.png)
2.  On the left-hand side pane, scroll to the bottom and click on “Developer Settings"
    ![](https://cpina.github.io/push-to-another-repository-docs/_images/pat-20.png)
3.  Click on “Personal Access Tokens” (also available at <https://github.com/settings/tokens>)
    ![](https://cpina.github.io/push-to-another-repository-docs/_images/pat-30.png)
4.  Generate a new token entering a name and expiration date, and choose “Repo”. Click the bottom button “Generate token”. If you choose an expiration date you will need to create a new token after this date. In this example, I have used “No expiration”; this should be used carefully.
    ![](https://cpina.github.io/push-to-another-repository-docs/_images/pat-40.png)
5.  Copy the displayed token
    ![](https://cpina.github.io/push-to-another-repository-docs/_images/pat-50.png)

Then make the token available to the GitHub Action using the following steps:

1.  Go to the GitHub page for the repository that you push from (origin repository). Click on “Settings” for the repository
2.  Click on “New repository secret”
    ![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1663544055/githubAction/newRepoSecret_gadfaz.png)
3.  Name: “API_TOKEN_GITHUB”
4.  Value: paste the token that you copied earlier
5.  Click on “Add secret”
    ![](https://cpina.github.io/push-to-another-repository-docs/_images/pat-70.png)


## Reference List {#reference-list}

1.  <https://cpina.github.io/push-to-another-repository-docs/overview.html>

