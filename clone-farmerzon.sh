#!/bin/sh

echo 'Insert Email: '
echo -n "> "
read email

REPOS="farmerzon"
REPOS="${REPOS} farmerzon-articles"
REPOS="${REPOS} farmerzon-order"
REPOS="${REPOS} farmerzon-frontend"
REPOS="${REPOS} farmerzon-authentication"
REPOS="${REPOS} farmerzon-alexa"
REPOS="${REPOS} farmerzon-recipes"

dir='./farmerzon'
if [ ! -d  $dir ] ; then
    mkdir $dir
fi
cd $dir

for repo in $REPOS ; do
    if [ ! -d $repo ] ; then
        git clone git@github.com:lukbraun/$repo.git
        cd $repo
        git config user.email $email
        cd ..
    else
        echo "$repo already exists. Checkout master and pull instead."
        cd $repo
        if git checkout master ; then
            git pull
        fi
        cd ..
    fi
done

if [ -d "farmerzon" ] ; then
    unlink ../clone
    unlink docker-compose.yml
    ln -n ./farmerzon/clone-farmerzon.sh ../clone
    ln -n farmerzon/docker-compose.yml docker-compose.yml
fi
