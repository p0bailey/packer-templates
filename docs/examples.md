
## NFS OSX Fix

`visudo` add the following line.

```
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
```



## Vagrantfile

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provision :hosts do |provisioner|
  provisioner.autoconfigure = true
end

#config.vbguest.auto_update = false
config.vm.define "box" do |box|

    box.vm.box = "p0bailey/debian-10"
    box.vm.box_version = "1.3"
    box.vm.network :private_network, ip: "192.168.56.143"
    box.vm.hostname = "box.local.com"
    box.ssh.insert_key = false


    box.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "2" ]
        v.customize [ "modifyvm", :id, "--memory", "1024" ]
    end

end

 end
```
