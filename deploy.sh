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

# Go to blog
cd ~/blog

# Have ssh key
if [ "$(ls -A ~/.ssh 2>/dev/null)" ]; then
    echo "***** .ssh directory exists and has content, continuing *****";
    testConnectionAndDeploy
# Have NOT ssh key
else
    initSSHkey
    testConnectionAndDeploy

fi;
