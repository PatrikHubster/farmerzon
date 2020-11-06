#!/bin/sh

echo 'Insert Email: '
echo -n "> "
read email

input_type = ''
while input_type != 'ssh' || input_type != 'http' do 
    echo 'Git clone strategy: '
    echo -n "> "
    read input_type
done

REPOS="farmerzon"
REPOS="${REPOS} farmerzon-address"
REPOS="${REPOS} farmerzon-articles"
REPOS="${REPOS} farmerzon-backend"
REPOS="${REPOS} farmerzon-order"
REPOS="${REPOS} farmerzon-frontend"
REPOS="${REPOS} farmerzon-authentication"
REPOS="${REPOS} farmerzon-alexa"
REPOS="${REPOS} farmerzon-recipes"
REPOS="${REPOS} farmerzon-farmer-joe"

cd ..

for repo in $REPOS ; do
    if [ ! -d $repo ] ; then
        if input_type == 'ssh' then
            git clone git@github.com:patrikhubster/$repo.git
        else
            git clone https://github.com/patrikhubster/$repo.git
        fi
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

cd farmerzon/
if [ -d "farmerzon" ] ; then
    unlink ../clone
    unlink docker-compose.yml
    ln -n ./farmerzon/clone-farmerzon.sh ../clone
    ln -n farmerzon/docker-compose.yml docker-compose.yml
fi
