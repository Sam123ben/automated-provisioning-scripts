# Automated Provisioning of CICD/DEVOPS Tools Using Docker & Ansible

This repository is created to help team to provision a docker container inside a vagrant image. This will create a new docker image with Centos flavour of Linux along with Jenkins and Ansible Tower installed. To ease up the setup, I have a shell script that will create the docker image and will run the container to start the Jenkins process.

As a best practice always ensure that the provisioning of any server or infra are done via any configuration management automation tool such as Ansible/Chef/Puppet/Salt. Even though we code our Dockerfile but still take care of creating image using Ansible rather the Dockerfile.

NOTE: The whole automation is developed and tested under a non-proxy network, but if you are under a proxy please do add appropriate proxy details in your Vagrantfile, Dockerfile, and Ansible vars file and in shell script to have a successful build of the Jenkins image. The whole automation might take an approx between 5 - 15 mins depending on the network speed.

##This co-relate to one of my favorite quote

    """ ALWAYS TREAT YOUR INFRA/SERVERS AS CATTLE AND NOT AS PET """

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
    3. cd vibrato-code-test/docker-repo/jenkins
    4. sudo sh ./docker-image-build.sh
       Pass the appropriate values for the parameters you will be prompted:
         a) vault_pass: qwertyuiop
         b) image_name: {understandable image name (eg: jenkins-{version-number}-master)}
         c) jenkins_version: {If you press enter without stating the version then default it will install and configure latest jenkins or you can specify a valid jenkins version to have it installed and configured}
    5. To create the container: docker run -d -p 443:443 --name tower {$IMAGE_NAME}
    6. You can access the url: 'https://192.168.33.10/' (uid/pwd: admin/password) [NOTE: Ensure the ip are not having any conflicts]

## [TESTING IN PROGRESS] Step to automate the Latest Jenkins installation on vagrant virtual box only for testing purpose only

    1. vagrant up
    2. on the browser type: http://192.168.33.10:8080
    3. vagrant ssh to login to VM
