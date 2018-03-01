# vibrato-code-test

This repository is created to help team to provision a docker container inside a vagrant image. This will create a new docker image with Centos flavour of Linux along with Jenkins and Ansible Tower installed. To ease up the setup, I have a shell script that will create the docker image and will run the container to start the Jenkins process.

As a best practice always ensure that the provisioning of any server or infra are done via any configuration management automation tool such as Ansible/Chef/Puppet/Salt. Even though we code our Dockerfile but still take care of creating image using Ansible rather the Dockerfile.

NOTE: The whole automation is developed and tested under a non-proxy network, but if you are under a proxy please do add appropriate proxy details in your Vagrantfile, Dockerfile, and Ansible vars file and in shell script to have a successful build of the Jenkins image.

##This co-relate to one of my favorite quote

    """ ALWAYS TREAT YOUR INFRA/SERVERS AS CATTLE AND NOT AS PET """

Below images could be built:

    1. Jenkins (latest version or any specific version):
        Install the latest/specific version of Jenkins inside the docker container, the Dockerfile will be having the base image and will then include the ansible playbooks to complete the installation and setup of Jenkins

        ## Dependencies
            - geerlingguy.java

    2. Ansible Tower (Specific version):
        Install the latest/specific version of Ansible tower inside the docker container. I used the opensource version of Dockerfile but customized it to fit in for layering the Ansible Tower installation and configuration


## Steps to manually create Jenkins Image using the shell script on your local macbook or any docker installed host machine

    1. vagrant up
    2. vagrant ssh
    4. cd vibrato-code-test/docker-repo/jenkins
    5. sudo sh ./docker-image-build.sh
       Pass the appropriate values for the parameters you will be prompted:
         a) vault_pass: qwertyuiop
         b) image_name: {understandable image name (eg: jenkins-{version-number}-master)}
         c) jenkins_version: {If you press enter without stating the version then default it will install and configure latest jenkins or you can specify a valid jenkins version to have it installed and configured}

## Step to automate the Latest Jenkins installation on vagrant

    1. vagrant up
    2. on the browser type: http://192.168.33.10:8080
    3. vagrant ssh to login to VM