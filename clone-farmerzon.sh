#!/bin/sh

echo 'Insert Email: '
echo -n "> "
read email

REPOS="farmerzon"
REPOS="${REPOS} farmerzon-articles"
REPOS="${REPOS} farmerzon-worker"
REPOS="${REPOS} farmerzon-frontend"
REPOS="${REPOS} farmerzon-authentication"

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
        echo "$repo already exists. Continue with next."
    fi
done
