# Packer Templates

Packer templates for Ubuntu and Centos with custom  scripts to bake EC2 instances and Vagrant boxes.

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
packer build -only=virtualbox-iso template.json
packer build -only=amazon-ebs template.json

```

## AWS credentials and variables.

Place AWS vars into ~.bashrc

```
export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Packer AWS variables examples.

```
"type": "amazon-ebs",
   "access_key": "{{user `aws_access_key`}}",
   "secret_key": "{{user `aws_secret_key`}}",
   "region": "eu-west-1",
   "source_ami": "ami-f9fee58a",
   "instance_type": "t2.nano",
   "ssh_username": "ubuntu",
   "vpc_id": "vpc-091d116c",
   "subnet_id": "subnet-3fa82249",
   "security_group_id": "sg-89235bed",
   "ami_name": "hello-app {{timestamp}}"
```

type = The amazon-ebs Packer builder is able to create Amazon AMIs backed by
EBS volumes for use in EC2.

access_key = (string) - The access key used to communicate with AWS.

secret_key = (string) - The secret key used to communicate with AWS.

region = (string) - The name of the region, such as "us-east-1", in which
to launch the EC2 instance to create the AMI.

source_ami = (string) - The initial AMI used as a base for the newly created
machine.

instance_type = (string) - The EC2 instance type to use while building the AMI,
such as "m1.small".

ssh_username = (string) - The username to use in order to communicate over SSH
to the running machine.

vpc_id = (string) - If launching into a VPC subnet, Packer needs the VPC ID in
order to create a temporary security group within the VPC.

subnet_id = (string) - If using VPC, the ID of the subnet, such as "subnet-12345def",
where Packer will launch the EC2 instance. This field is required if you are using
an non-default VPC.

security_group_id = string) - The ID (not the name) of the security group to assign
to the instance. By default this is not set and Packer will automatically create a
new temporary security group to allow SSH access. Note that if this is specified,
you must be sure the security group allows access to the ssh_port given below.

ami_name =  The name of the resulting AMI that will appear when managing AMIs in
the AWS console or via APIs. This must be unique. To help make this unique, use
a function like timestamp.


https://www.packer.io/docs/builders/amazon-instance.html


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
