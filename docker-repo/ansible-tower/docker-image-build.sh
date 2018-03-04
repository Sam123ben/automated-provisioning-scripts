#!/bin/sh

echo '\n\nPlease enter the known vault password (vault_pass): '
read vault_pass

echo '\n\nPlease enter a unique Image Name to be created (image_name): '
read image_name

echo '\n\nPlease enter the version of Ansile-Tower (AWX) you wish to install (tower_version): '
read tower_version

echo "\n\nThe jenkins version that will be installed is: $tower_version"
echo '\n\nBuilding the above version of Docker-jenkins image\n'
docker build -t $image_name --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg tower_version=$tower_version --build-arg "no_proxy=$no_proxy" .

container_name=$image_name-app

echo "\n\nRun the Ansible-Tower container\n"
docker run -d -p 9000:443 --name $container_name $image_name
