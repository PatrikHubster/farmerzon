#!/bin/sh

helpFunction()
{
   echo ""
   echo "Usage: $0 -e <email-address> -m <clone-mode>"
   echo "\t-e Email address which is used to clone from GitHub."
   echo "\t-m Mode which is used to clone from GitHub. You can use https or ssh as input."
   exit 1 # Exit script after printing help
}

while getopts ":e:m:" opt
do
   case "$opt" in
      e ) parameterEmail="$OPTARG" ;;
      m ) parameterMode="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterEmail" ] || [ -z "$parameterMode" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

if [ "$parameterMode" != "ssh" ] && [ "$parameterMode" != "https" ]
then
    echo "The mode has to be https or ssh. Therefor see the usage";
    helpFunction
fi

# Begin script in case all parameters are correct
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

dir='./farmerzon'
if [ ! -d  $dir ] ; then
    mkdir $dir
fi
cd $dir

for repo in $REPOS ; do
    if [ ! -d $repo ] ; then
        if [ "$parameterMode" == "ssh" ] ; then
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

if [ -d "farmerzon" ] ; then
    if [ -f "docker-compose.yml"] ; then
        unlink docker-compose.yml
    fi
    ln -n farmerzon/docker-compose.yml docker-compose.yml
fi