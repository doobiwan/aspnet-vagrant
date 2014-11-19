# aspnet-vagrant

### Quickstart vagrant file for asp.net vNext development on a Linux VM for Windows.

To get started, install VirtualBox and Vagrant using Chocolatey (https://chocolatey.org/)you'll need a command window, personally I'm a fan of git bash on windows.

```bash
cinst virtualbox vagrant
```

Download the Vagrantfile by cloning this repository, then run the VagrantFile with `vagrant up`.
```bash
git clone https://github.com/doobiwan/aspnet-vagrant.git
cd aspnet-vagrant
vagrant up
```

Downloading the image and installing everything takes a few minutes. When it's done connect to the VM, and start the app.
```bash
vagrant ssh
cd ~/aspnetdemo/HelloWorldVNext/src/hellomvc
k web
```

the hellomvc site will be available on your local machine, as vagrant has been set up to forward port 5000.
```bash
http://localhost:5000
```

Enjoy.

### Bonus round: C# Syntax highlighting for Nano
Nano is a lightweight text mode editor that doesn't require a black belt in Finger-Fu to operate. To add C# syntax highlighting we copy and enable the `csharp.nanorc` file included in this repository. Presuming you're already SSH'ed into the VM:
```bash
sudo cp /vagrant/csharp.nanorc /usr/share/nano/
echo 'include "/usr/share/nano/csharp.nanorc"' >> ~/.nanorc
```
