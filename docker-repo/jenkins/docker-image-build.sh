#!/bin/sh

master_port='8080'
agent_port='8085'

master_redirect_port="8080"
agent_redirect_port='8085'

echo '\nPlease enter the known vault password: '
read vault_pass

echo '\nPlease enter a unique Image Name to be created: '
read image_name

echo '\nPlease enter the version of Jenkins you wish to install,
or the default value will be latest if not entered explicitly: '
read jenkins_version

if [ -n "$jenkins_version" ]
then
      echo "\nThe jenkins version that will be installed is: $jenkins_version"
      echo '\nBuilding the Docker-jenkins image\n'
      jenkins_version_run_cmd="--extra-vars "JENKINS_VERSION=$jenkins_version""
      docker image build -t $image_name --build-arg master_port=$master_port --build-arg agent_port=$agent_port --build-arg VAULT_PWD=$vault_pass --build-arg jenkins_version=$jenkins_version  --build-arg jenkins_master_run_cmd="$jenkins_version_run_cmd" .
else
      echo "\nThe jenkins version that will be installed is: latest"
      echo '\nBuilding the latest version of Docker-jenkins image\n'
      docker image build -t $image_name --build-arg master_port=$master_port --build-arg agent_port=$agent_port --build-arg VAULT_PWD=$vault_pass .
fi

container=$image_name-app
sleep 10s

echo '\nRunning the container'
docker run --restart=always --name $container -u jenkins -p $master_redirect_port:$master_port -p $agent_redirect_port:$agent_port -d $image_name

sleep 5s
docker ps
