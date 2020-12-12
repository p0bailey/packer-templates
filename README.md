# packer-templates

**Table of content.**

<!-- toc -->

- [Prerequisites](#prerequisites)
- [Templates usage](#templates-usage)
- [Vagrantfiles](#vagrantfiles)
- [Changelog](#changelog)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- tocstop -->

Vagrant boxes built with these packer templates are available at: https://app.vagrantup.com/p0bailey/


Debian and  Centos Packer templates with **[HCL2](https://bailey.st/2020/11/01/packer-virtualbox-builder-from-json-to-hcl.html)** syntax.

**Supported builds:**


|  Distribution | Version  | Template   |
|---|---|---|
| Debian  |   10.7|  [debian-10](debian-10)   |
|  CentoOS 7 | 7.9 |  [centos-7](centos-7)   |
|  CentoOS 8 | 7.9 |  [centos-8](centos-8)   |


**OS images.**

Centos - http://centos.serverspace.co.uk/centos

Debian - http://cdimage.debian.org/debian-cd

## Prerequisites

* Packer - www.packer.io
* Vagrant - www.vagrantup.com
* Virtualbox - https://www.virtualbox.org

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

## Vagrantfiles



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
