Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum update -y && yum install -y python ansible git \
         && yum install -y yum-utils device-mapper-persistent-data lvm2 \
         && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
         && systemctl enable firewalld && systemctl start firewalld && systemctl status firewalld \
         && yum-config-manager --enable docker-ce-edge && yum install -y docker-ce epel-release nginx mod_ssl FirewallD \
         && usermod -aG docker vagrant \
         && systemctl enable docker && systemctl start docker && systemctl status docker \
         && systemctl enable nginx && systemctl start nginx && systemctl status nginx \
         && docker run hello-world \
         && docker ps -a \
         && mkdir /etc/ssl/private && mkdir /etc/nginx/sites-enabled \
         && chmod 700 /etc/ssl/private \
         && firewall-cmd --add-service=http && firewall-cmd --add-service=https && firewall-cmd --runtime-to-permanent \
         && iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT && iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT



    git clone -b feature/vagrant-setup https://github.com/Sam123ben/vibrato-code-test.git
    sudo ansible-playbook /home/vagrant/vibrato-code-test/docker-repo/jenkins/Utilities/ansible-playbooks/samyak.configure-nginx.yml
    sudo systemctl restart nginx && systemctl status nginx
    sudo sh /home/vagrant/vibrato-code-test/docker-repo/jenkins/vagrant-auto-build.sh
  SHELL

end
