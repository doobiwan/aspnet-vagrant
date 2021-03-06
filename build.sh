# Enable bash color, just because.
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
source ~/.bashrc

# Configure mono repository
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee --append /etc/apt/sources.list.d/mono-xamarin.list

# update packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -qqy install git nodejs nodejs-legacy npm unzip mono-complete autoconf automake build-essential libtool

# We can use yeoman to scaffold an asp.net project
sudo npm install -g grunt yo bower generator-aspnet

# Install kvm & latest kre
curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh \
  && source ~/.kre/kvm/kvm.sh \
  && kvm upgrade

# Configure NuGet SSL certificates
sudo mozroots --import --machine --sync
yes | sudo certmgr -ssl -m https://go.microsoft.com
yes | sudo certmgr -ssl -m https://nugetgallery.blob.core.windows.net
yes | sudo certmgr -ssl -m https://nuget.org
yes | sudo certmgr -ssl -m https://www.myget.org

# Get demo projects
mkdir ~/aspnetdemo
cd ~/aspnetdemo
git clone https://github.com/davidfowl/HelloWorldVNext.git

# Build and run
cd ~/aspnetdemo/HelloWorldVNext/src/hellomvc
kpm restore

echo "*****************************************************************"
echo "* Done."
echo "* To launch the hellomvc project enter:"
echo "*"
echo "*   vagrant ssh"
echo "*   cd ~/aspnetdemo/HelloWorldVNext/src/hellomvc"
echo "*   k web"
echo "* view on http://localhost:5000/"
echo "*"
echo "* Create a new asp.net project with 'yo aspnet'"
echo "*****************************************************************"