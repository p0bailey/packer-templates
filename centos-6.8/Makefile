#Authored by Phillip Bailey
.PHONY: all virtualbox aws vagrant
.SILENT:


all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


virtualbox: ## build virtualbox image
	packer build -only=virtualbox-iso template.json

aws: ## build aws image
	packer build -only=amazon-ebs template.json

vagrant: ## starts the vagrant box
	vagrant up
