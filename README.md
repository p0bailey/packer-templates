# packer-templates

Table of content.


<!-- MDTOC maxdepth:6 firsth1:1 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [packer-templates](#packer-templates)   
- [Packer Templates](#packer-templates)   
   - [Installing / Getting started](#installing-getting-started)   
      - [Prerequisites](#prerequisites)   
   - [Templates usage](#templates-usage)   
   - [Vagrantfile](#vagrantfile)   
   - [OS images.](#os-images)   
   - [Changelog](#changelog)   
   - [Contributing](#contributing)   
   - [Authors](#authors)   
   - [License](#license)   

<!-- /MDTOC -->



Vagrant boxes built with these packer templates are available at: https://app.vagrantup.com/p0bailey/


# Packer Templates

Ubuntu, Debian and  Centos Packer templates with custom  scripts to bake Vagrant boxes and upload them into Vagrant cloud.

Supported builds:


|  Distribution | Debian  | Ubuntu  | CentOS  |Misc  |
|---|---|---|---|---|
|   |   9|  18.04  |7.6   |k8 (Kubernetes + Docker)   |



## Installing / Getting started

### Prerequisites

* Terraform - www.terraform.io

* Packer - www.packer.io

* Vagrant - www.vagrantup.com

* `vagrant plugin install vagrant-vbguest`

* Virtualbox - https://www.virtualbox.org/

## Templates usage

`git clone https://github.com/p0bailey/packer-templates.git`

Workflow

`make virtualbox`

`make vagrant_up`

`make vagrant_upload`


Makefile Menu
```
virtualbox                     build virtualbox image
vagrant_up                     starts the vagrant box
vagrant_upload                 Publish and release a new Vagrant Box on Vagrant Cloud
vagrant_clean                  stops and removes vagrant box
vagrant_stop_all               stop all Vagrant machines
vagrant_status                 outputs status Vagrant environments for this user
```

## Vagrantfile

Example Vagrantfile to consume Vagrant Boxes built from this repository.
```
# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_ADDR = "192.168.56.55"
HOSTNAME = "server-vagrant"
BOX_NAME = "p0bailey/box_name"
CPUS = "2"
MEMORY = "1024"
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

config.vm.define "box" do |box|

    box.vm.box = "BOX_NAME"
    box.vm.network :private_network, ip: "IP_ADDR"
    box.vm.hostname = "HOSTNAME"
    box.ssh.insert_key = false

    box.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "CPUS" ]
        v.customize [ "modifyvm", :id, "--memory", "MEMORY" ]
    end

end
 end


```

## OS images.

Centos - http://centos.serverspace.co.uk/centos

Ubuntu - http://releases.ubuntu.com/

Debian - http://cdimage.debian.org/debian-cd


## Changelog

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D



## Authors

Phillip Bailey <phillip@bailey.st>

## License

N/A
