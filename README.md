# Packer Demo

Packer demo along with scripts to bake EC2 instances.

## Installation

To install packer use this Ansible role.

https://github.com/p0bailey/ansible-packer

## Usage

```
packer build aws-demo.js
```

Packer AWS variables.


```
"type": "amazon-ebs",
"access_key": "{{user `aws_access_key`}}",
"secret_key": "{{user `aws_secret_key`}}",
"region": "eu-west-1",
"source_ami": "ami-xxxxx",
"instance_type": "t2.nano",
"ssh_username": "ubuntu",
"vpc_id": "vpc-xxxxx",
"subnet_id": "subnet-xxxxx",
"security_group_id": "sg-xxxxx",
"ami_name": "hello-app {{timestamp}}"
```



## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D



## Authors

Phillip Bailey <phillip@bailey.st>

## License

TODO: Write license
