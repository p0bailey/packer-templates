# Vagrant Boxes

Vagrant boxes built with these packer templates can be found at: https://app.vagrantup.com/p0bailey/


# Packer Templates

Ubuntu, Debian and  Centos Packer templates with custom  scripts to bake EC2 instances and Vagrant boxes.

Supported builds:

debian-8

debian-9

ubuntu-18.04

ubuntu-16.04

ubuntu-14.04

k8 - Docker and Kubernetes

centos-7.6

centos-7.5

centos-7.4

centos-7.3

centos-6.9

centos-6.8





## Packer Installation

To install packer use this Ansible role.

https://github.com/p0bailey/ansible-packer

Or install packer manually as described below.

 https://www.packer.io/intro/getting-started/setup.html

## Vagrant setup.

Installing Vagrant: https://www.vagrantup.com/docs/installation/

## Templates usage

Custom provisioning.

Add any custom feature or software package into "scripts/provision.sh"

Run.

```
make virtualbox

```

Testing on virtualbox.

For convenience each build directory contains a custom Vagrantfile,
to test your newly created box please run.

Start Vagrant box.

```
make vagrant_up
```

Destroy and remove Vagrant box.

```
vagrant_clean
```

## Provisioning.

To add additional packages please locate scripts/provision.sh and add your code there.


## OS images.

Centos - http://centos.serverspace.co.uk/centos

Ubuntu - http://releases.ubuntu.com/

Debian - http://cdimage.debian.org/debian-cd


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
