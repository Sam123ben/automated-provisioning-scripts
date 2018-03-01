#!/bin/sh

master_port='8080'
agent_port='8085'

master_redirect_port="8080"
agent_redirect_port='8085'

echo '\nThe known vault password: '
$1

echo '\n\nThe unique Image Name to be created: '
$2

echo '\n\nThe version of Jenkins you wish to install'
$3

if [ -n "$3" ]
then
      echo "\n\nThe jenkins version that will be installed is: $3"
      echo '\n\nBuilding the Docker-jenkins image\n'
      jenkins_version_run_cmd="--extra-vars "JENKINS_VERSION=$3""
      docker image build -t $2 --build-arg master_port=$master_port --build-arg agent_port=$agent_port --build-arg VAULT_PWD=$1 --build-arg jenkins_version=$3  --build-arg jenkins_master_run_cmd="$jenkins_version_run_cmd" .
else
      echo "\nThe jenkins version that will be installed is: latest"
      echo '\nBuilding the latest version of Docker-jenkins image\n'
      docker image build -t $2 --build-arg master_port=$master_port --build-arg agent_port=$agent_port --build-arg VAULT_PWD=$1 .
fi

container_name=$2-app
sleep 10s

echo '\nRunning the container'
docker run --restart=always --name $container_name -u jenkins -p $master_redirect_port:$master_port -p $agent_redirect_port:$agent_port -d $2

sleep 5s
docker ps
