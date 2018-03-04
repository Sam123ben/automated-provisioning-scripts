# Automated Provisioning and Installation of Ansible Tower on Docker

This repo holds the source code to create an image that have Ansible Tower installed and configured to run on default 80/443 Nginx server. If your host latop or workstation or vagrant VM already is mapped to port 443/80 then please port forwarding to a different available port (8000/9090) from 443 docker conatiner port to run the container successfully.

Below image could be built:

    1. Ansible Tower (Specific version):
        Install the latest/specific version of Ansible tower inside the docker container. I used the opensource version of Dockerfile but customized it to fit in for layering the Ansible Tower installation and configuration.

        This works on any host machine (MACOS/Linux) keeping in mind that no IP conflicts.

## [DONE] Steps to manually create ansible tower Image using the shell script on your local macbook or any docker installed host machine (Vagrant/EC2)

    1. vagrant up (This will install and configure NGINX on your host VM)
    2. vagrant ssh
    3. cd automated-provisioning-scripts/docker-repo/ansible-tower
    4. sudo sh ./docker-image-build.sh
       Pass the appropriate values for the parameters you will be prompted:
         a) Please enter the known vault password (vault_pass): qwertyuiop
         b) Please enter a unique Image Name to be created (image_name): {understandable image name (eg: ansible-tower-{version-number}-master)}
         c) Please enter the version of Ansile-Tower (AWX) you wish to install (tower_version): {If you press enter without stating the version then default it will install and configure latest jenkins or you can specify a valid jenkins version to have it installed and configured}
    6. You can access the url: 'https://192.168.33.10:9000/' (uid/pwd: admin/password) [NOTE: Ensure the ip/ports are not having any conflicts or been used already]
