# Automated Provisioning of CICD/DEVOPS Tools Using Docker & Ansible

This repository is created to help team in provisioning a docker container inside a vagrant image or on our own local mac book or on ec2 linux instance. This will create a new docker image with Centos/Ubuntu flavour of Linux along with Jenkins and Ansible Tower installed. To ease up the setup, I have a shell script that will create the docker image and will run the container to start the Jenkins process and ansible-tower too.

As a best practice always ensure that the provisioning of any server or infra are done via the configuration management automation tool such as Ansible/Chef/Puppet/Salt. We need to code our Dockerfiles but still take care while creating the image, we provision it using Ansible rather not with the Dockerfile.

NOTE: The whole automation is developed and tested under a non-proxy network, but if you are under a proxy please do add appropriate proxy details in your Vagrantfile, Dockerfile, and Ansible vars file and in shell script to have a successful build of the Jenkins image. The whole automation might take an approx between 5 - 15 mins depending on the network speed.

##This co-relate to one of my favorite quote

    """ ALWAYS TREAT YOUR INFRA/SERVERS AS CATTLE AND NOT AS PET """

If the Vagrant is successfully provisioned then you can copy paste the below URL to test if the sample wesbsite page is running or not:

https://192.168.33.16/

Below images could be built:

    1. Ansible Tower (Specific version):
        Install the latest/specific version of Ansible tower inside the docker container. I used the opensource version of Dockerfile but customized it to fit in for layering the Ansible Tower installation and configuration.

        This works on any host machine (MACOS/Linux) keeping in mind that no IP conflicts.

    2. Jenkins (latest version or any specific version):
        Install the latest/specific version of Jenkins inside the docker container, the Dockerfile will be having the base image and will then include the ansible playbooks to complete the installation and setup of Jenkins

        ## Dependencies
            - geerlingguy.java

## [DONE] Steps to manually create Jenkins Image using the shell script on your local macbook or any docker installed host machine 

    1. vagrant up (This will install and configure NGINX on your host VM)
    2. vagrant ssh
    3. cd automated-provisioning-scripts/docker-repo/jenkins
    4. sudo sh ./docker-image-build.sh
       Pass the appropriate values for the parameters you will be prompted:
         a) vault_pass: qwertyuiop
         b) image_name: {understandable image name (eg: jenkins-{version-number}-master)}
         c) jenkins_version: {If you press enter without stating the version then default it will install and configure latest jenkins or you can specify a valid jenkins version to have it installed and configured}
    6. You can access the url: 'http://192.168.33.10:8080/' (uid/pwd: admin/password) [NOTE: Ensure the ip are not having any conflicts]

    7. For running Ansible Tower docker container: 
	a) step 1 and 2
        b) cd automated-provisioning-scripts/docker-repo/ansible-tower
        c) sudo sh ./docker-image-build.sh
        d) As the port number of the vagrant box already been used by Nginx (443/80) so map a different port of your wish to run the container
	   , if mapped to 9000 then the url: https://192.168.33.16:9000 (docker run -d -p 9000:443 --name tower ansible-tower-3.2.3)

## [TESTING IN PROGRESS] Step to automate the Latest Jenkins installation on vagrant virtual box only for testing purpose only

    1. vagrant up
    2. on the browser type: http://192.168.33.10:8080
    3. vagrant ssh to login to VM
