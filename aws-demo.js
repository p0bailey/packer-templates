{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": ""
  },
  "builders": [{
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
}],

"provisioners": [{
    "type": "shell",
    "script": "scripts/ansible.sh"
}]

}
