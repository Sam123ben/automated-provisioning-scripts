#!/bin/sh

master_port='8080'
agent_port='8085'

master_redirect_port="8080"
agent_redirect_port='8085'

echo '\nThe known vault password: '
vault_pass="qwertyuiop"

echo '\n\nThe unique Image Name to be created: '
image_name="jenkins-latest"

echo "\nThe jenkins version that will be installed is: latest"
echo '\nBuilding the latest version of Docker-jenkins image\n'
docker build -t $image_name --build-arg master_port=$master_port --build-arg agent_port=$agent_port --build-arg VAULT_PWD=$vault_pass -f /home/vagrant/vibrato-code-test/docker-repo/jenkins/Dockerfile .

container_name=$image_name-app
sleep 10s

echo '\nRunning the container'
docker run --restart=always --name $container_name -u jenkins -p $master_redirect_port:$master_port -p $agent_redirect_port:$agent_port -d $image_name

sleep 5s
docker ps
