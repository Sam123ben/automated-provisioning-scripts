# vibrato-code-test

This repository is created to help team to provision a docker container inside a vagrant image. This will create a new docker image with Centos flavour of Linux along with Jenkins and Ansible Tower installed.

Below images could be built:

    1. Jenkins (latest version or any specific version):
        Install the latest/specific version of Jenkins inside the docker container, the Dockerfile will be having the base image and will then include the ansible playbooks to complete the installation and setup of Jenkins

        ## Dependencies
            - geerlingguy.java

    2. Ansible Tower (Specific version):
        Install the latest/specific version of Ansible tower inside the docker container. I used the opensource version of Dockerfile but customized it to fit in for layering the Ansible Tower installation and configuration

