Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.provision "shell", inline: <<-SHELL
    sudo yum update -y && yum install -y python ansible git
    cd /home/vagrant/vibrato-code-test
  SHELL

end
