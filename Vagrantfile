# -*- mode: ruby -*-
# vi: set ft=ruby :

#The provisioning script to run on the VM
$script = <<SCRIPT
# Enable bash color, just because.
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
source ~/.bashrc

# Configure mono repository
apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list

# update packages
apt-get update
apt-get upgrade -y
apt-get -qy install git nodejs nodejs-legacy npm unzip mono-complete autoconf automake build-essential libtool

# We can use yeoman to scaffold an asp.net project
npm install -g grunt yo bower generator-aspnet

# Install kvm & latest kre
curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh \
  && source ~/.kre/kvm/kvm.sh \
  && kvm upgrade

# Configure NuGet SSL certificates
mozroots --import --machine --sync
yes | certmgr -ssl -m https://go.microsoft.com
yes | certmgr -ssl -m https://nugetgallery.blob.core.windows.net
yes | certmgr -ssl -m https://nuget.org
yes | certmgr -ssl -m https://www.myget.org

# Get demo projects
mkdir ~/aspnetdemo
cd ~/aspnetdemo
git clone https://github.com/davidfowl/HelloWorldVNext.git

# Build and run
cd ~/aspnet/HelloWorldVNext/src/hellomvc
kpm restore
k web

echo "$(tput setaf 2)Done. To create a new asp.net project create a project folder and enter 'yo aspnet'"
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "forwarded_port", guest: 5001, host: 5001 # 'k web'
  config.vm.network "forwarded_port", guest: 5004, host: 5004 # 'k web-kestrel'
  config.vm.synced_folder "./data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
   vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", inline: $script
end
