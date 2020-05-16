#!/bin/sh

echo 'Remove everything - even database-volumes!'
echo 'Continue in 5 seconds'
sleep 5
sudo docker container prune \
        && sudo docker system prune --volumes \
        && sudo docker image rm $(sudo docker image ls -aq)
