{
"builders": [
{
  "type": "virtualbox-iso",
"boot_command": [
  "<esc><wait>",
  "install <wait>",
  " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
  "debian-installer=en_US.UTF-8 <wait>",
  "auto <wait>",
  "locale=en_US.UTF-8 <wait>",
  "kbd-chooser/method=us <wait>",
  "keyboard-configuration/xkb-keymap=us <wait>",
  "netcfg/get_hostname={{ .Name }} <wait>",
  "netcfg/get_domain=vagrantup.com <wait>",
  "fb=false <wait>",
  "debconf/frontend=noninteractive <wait>",
  "console-setup/ask_detect=false <wait>",
  "console-keymaps-at/keymap=us <wait>",
  "grub-installer/bootdev=/dev/sda <wait>",
  "<enter><wait>"
],
"boot_wait": "10s",
"disk_size": 20000,
"guest_os_type": "${guest_os_type}",
"guest_additions_path": "VBoxGuestAdditions_{{.Version}}.iso",
"http_directory": "http",
"iso_checksum": "${iso_checksum}",
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
          "output": "${distro}-${release}-x64-virtualbox.box"
        }
      }
    }
  ]
}
