
## NFS OSX Fix

`visudo` add the following line.

```
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
```

## Install Terraform

```
TERRAFORM_VERSION="0.12.20"

cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

```
