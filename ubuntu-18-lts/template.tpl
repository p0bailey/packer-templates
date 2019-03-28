{
"builders": [
{
  "type": "virtualbox-iso",
"boot_command": [
"<enter><wait><f6><esc><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
"<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
"<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
"<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
"/install/vmlinuz<wait>",
" auto<wait>",
" console-setup/ask_detect=false<wait>",
" console-setup/layoutcode=us<wait>",
" console-setup/modelcode=pc105<wait>",
" debconf/frontend=noninteractive<wait>",
" debian-installer=en_US<wait>",
" fb=false<wait>",
" initrd=/install/initrd.gz<wait>",
" kbd-chooser/method=us<wait>",
" keyboard-configuration/layout=USA<wait>",
" keyboard-configuration/variant=USA<wait>",
" locale=en_US<wait>",
" netcfg/get_domain=vm<wait>",
" netcfg/get_hostname=vagrant<wait>",
" grub-installer/bootdev=/dev/sda<wait>",
" noapic<wait>",
" preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg",
" -- <wait>",
"<enter><wait>"
],
"boot_wait": "10s",
"disk_size": 20000,
"guest_os_type": "${guest_os_type}",
"guest_additions_path": "VBoxGuestAdditions_{{.Version}}.iso",
"http_directory": "http",
"iso_checksum": "${iso_checksum}",
"iso_checksum_type": "${iso_checksum_type}",
"iso_url": "${iso_url}",
"ssh_username": "vagrant",
"ssh_password": "vagrant",
"ssh_port": 22,
"ssh_wait_timeout": "10000s",
"shutdown_command": "echo 'vagrant'|sudo -S /sbin/shutdown -hP now",
"vboxmanage": [
  [ "modifyvm", "{{.Name}}", "--memory", "${memory}" ],
  [ "modifyvm", "{{.Name}}", "--cpus", "${cpus}" ]
]
}],
"provisioners": [
      {
        "type": "shell",
        "execute_command": "echo 'vagrant'|sudo -S sh '{{.Path}}'",
        "override": {
          "virtualbox-iso": {
            "scripts": [
              "scripts/base.sh",
              "scripts/vagrant.sh",
              "scripts/virtualbox.sh",
              "scripts/provision.sh",
              "scripts/cleanup.sh",
              "scripts/zerodisk.sh"
            ]
          }
        }
      }
      ],
"post-processors": [
    {
      "type": "vagrant",
      "override": {
        "virtualbox": {
          "output": "${distro}-${version}-x64-virtualbox.box"
        }
      }
    }
  ]
}
