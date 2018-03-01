Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum update -y && yum install -y python ansible git \
         && yum install -y yum-utils device-mapper-persistent-data lvm2 \
         && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
         && yum-config-manager --enable docker-ce-edge && yum install -y docker-ce \
         && usermod -aG docker vagrant \
         && systemctl enable docker && systemctl start docker && systemctl status docker \
         && docker run hello-world \
         && docker ps -a

    git clone -b feature/vagrant-setup https://github.com/Sam123ben/vibrato-code-test.git
    cd /home/vagrant/vibrato-code-test
  SHELL

end
