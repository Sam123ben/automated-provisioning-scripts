# Automated Provisioning and Installation of Jenkins Tower on Docker

This repo host the source code to install jenkins Latest/LTS or any specific version we wish to install and configure. Its a mix of Ansible and Dockerfile where the provision, installation and configuration of the jenkins is done using Ansible (Prefer tool for the container provisioning automation). This will install all the required plugins and will configure the Jenkins in layer. So in case a team wish to not use any plugins they can edit the same in the pluginx.txt file without any modification to Dockerfile. The intent need to be clear that is we have a Dockerfile that will host the jenkins container using Ansible.

Below images could be built:

    1. Jenkins (latest version or any specific version):
        Install the latest/specific version of Jenkins inside the docker container, the Dockerfile will be having the base image and will then include the ansible playbooks to complete the installation and setup of Jenkins

        ## Dependencies
            - geerlingguy.java (Why to create a new when we have a role already available, and this is what we call egoless programming)

        This works on any host machine (MACOS/Linux) keeping in mind that no IP conflicts.

## [DONE] Steps to manually create Jenkins Image using the shell script on your local macbook or any docker installed host machine (Vagrant/EC2)

    1. vagrant up (This will install and configure NGINX on your host VM)
    2. vagrant ssh
    3. cd automated-provisioning-scripts/docker-repo/jenkins
    4. sudo sh ./docker-image-build.sh
       Pass the appropriate values for the parameters you will be prompted:
         a) vault_pass: qwertyuiop
         b) image_name: {understandable image name (eg: jenkins-{version-number}-master)}
         c) jenkins_version: {If you press enter without stating the version then default it will install and configure latest jenkins or you can specify a valid jenkins version to have it installed and configured}
    6. You can access the url: 'http://192.168.33.10:8080/' (uid/pwd: admin/password) [NOTE: Ensure the ip/port are not having any conflicts or are in use]
