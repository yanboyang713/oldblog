#!/bin/bash

testConnection=$(ssh -T git@github.com 2>&1)

if [[ $testConnection =~ successfully ]]; then
    echo "***** App .ssh directory exists and has content, continuing *****";
else
    echo "***** App .ssh directory is empty, initialising ssh key and configuring known_hosts for common git repositories (github/gitlab) *****"
fi;


RepositorieName=$(grep -oP '(?<=[[:space:]]).*?(?=!)' <<< "$testConnection")

#set git remote URL
git remote set-url origin git@github.com:"$RepositorieName".git

git commit -m "$msg"
