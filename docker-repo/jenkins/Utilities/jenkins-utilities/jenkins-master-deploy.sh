#!/bin/bash

sudo docker image build -t jenkins-master-image .

docker-compose up -d
