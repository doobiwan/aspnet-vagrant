# -*- mode: ruby -*-
# vi: set ft=ruby :

#The provisioning script to run on the VM
$script = "build.sh"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "ubuntu/utopic32"
  #config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.box = "ubuntu/utopic64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "forwarded_port", guest: 5000, host: 5000 # 'k web'

  config.vm.provider "virtualbox" do |vb|
   vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", path: $script, privileged: false
end
