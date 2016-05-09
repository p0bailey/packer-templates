{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": ""
},

"builders": [
    {
    "type": "amazon-ebs",
    "access_key": "{{user `aws_access_key`}}",
    "secret_key": "{{user `aws_secret_key`}}",
    "region": "eu-west-1",
    "source_ami": "ami-f95ef58a",
    "instance_type": "t2.nano",
    "ssh_username": "ubuntu",
    "vpc_id": "vpc-091d006c",
    "subnet_id": "subnet-3fa84449",
    "security_group_id": "sg-89435bed",
    "ami_name": "hello-app {{timestamp}}"
}
,
{
  "type": "virtualbox-iso",
"boot_command": [
  "<esc><wait>",
  "<esc><wait>",
  "<enter><wait>",
  "/install/vmlinuz<wait>",
  " auto<wait>",
  " console-setup/ask_detect=false<wait>",
  " console-setup/layoutcode=us<wait>",
  " console-setup/modelcode=pc105<wait>",
  " debian-installer=en_US<wait>",
  " fb=false<wait>",
  " initrd=/install/initrd.gz<wait>",
  " kbd-chooser/method=us<wait>",
  " keyboard-configuration/layout=USA<wait>",
  " keyboard-configuration/variant=USA<wait>",
  " locale=en_US<wait>",
  " netcfg/get_hostname=ubuntu-1404<wait>",
  " netcfg/get_domain=vagrantup.com<wait>",
  " noapic<wait>",
  " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<wait>",
  " -- <wait>",
  "<enter><wait>"
],
"boot_wait": "10s",
"disk_size": 40960,
"guest_os_type": "Ubuntu_64",
"http_directory": "http",
"iso_checksum": "2ac1f3e0de626e54d05065d6f549fa3a",
"iso_checksum_type": "md5",
"iso_url": "http://releases.ubuntu.com/14.04/ubuntu-14.04.4-server-amd64.iso",
"ssh_username": "vagrant",
"ssh_password": "vagrant",
"ssh_port": 22,
"ssh_wait_timeout": "10000s",
"shutdown_command": "echo 'shutdown -P now' > /tmp/shutdown.sh; echo 'vagrant'|sudo -S sh '/tmp/shutdown.sh'",
"vboxmanage": [
  [ "modifyvm", "{{.Name}}", "--memory", "512" ],
  [ "modifyvm", "{{.Name}}", "--cpus", "1" ]
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
              "scripts/cleanup.sh",
              "scripts/zerodisk.sh",
              "scripts/provision.sh"
            ]
          },
          "amazon-ebs": {
            "scripts": [
              "scripts/provision.sh"
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
          "output": "ubuntu-14-04-x64-virtualbox.box"
        }
      }
    }
  ]


}
