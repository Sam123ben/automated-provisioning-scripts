#!/bin/bash

docker-compose down

sleep 10

docker rmi jenkins-master-image

#sudo rm -Rf jenkins_home/*


