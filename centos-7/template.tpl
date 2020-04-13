{
"builders": [
{
  "type": "virtualbox-iso",
"boot_command": [
  "<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"
],
"boot_wait": "10s",
"disk_size": 20000,
"guest_os_type": "${guest_os_type}",
"headless": true,
"guest_additions_path": "VBoxGuestAdditions_{{.Version}}.iso",
"http_directory": "http",
"iso_checksum": "${iso_checksum}",
"iso_checksum_type": "${iso_checksum_type}",
"iso_urls": [
  "${iso_name}",
  "${iso_url}"
],
"ssh_username": "vagrant",
"ssh_password": "vagrant",
"ssh_port": 22,
"ssh_wait_timeout": "10000s",
"shutdown_command": "echo 'vagrant'|sudo -S /sbin/halt -h -p",
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
