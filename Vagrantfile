
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.16"
  config.vm.provider "virtualbox" do |v|
      v.memory = 5096
      v.cpus = 4
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum update -y && yum install -y python ansible git \
         && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
         && yum-config-manager --enable docker-ce-edge \
         && git clone -b develop https://github.com/Sam123ben/automated-provisioning-scripts.git \
         && ansible-playbook /home/vagrant/automated-provisioning-scripts/docker-repo/jenkins/Utilities/ansible-playbooks/samyak.configure-nginx.yml \
         && sh /home/vagrant/automated-provisioning-scripts/docker-repo/jenkins/docker-image-build.sh
  SHELL

end
