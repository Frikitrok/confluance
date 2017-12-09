Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.box_check_update = false
  #config.vm.synced_folder "/home/frikitrok/vagrant/ubuntu", "/var/sync"
  config.vm.provision "shell",
    inline: "/bin/bash /vagrant/docker_ce.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.name = 'ubuntu_machine'
	vb.memory = "3024"
   end
end
