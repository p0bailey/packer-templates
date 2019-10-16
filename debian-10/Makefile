#Authored by Phillip Bailey
.PHONY: all virtualbox  vagrant_up  vagrant_clean vagrant_stop_all vagrant_status
.SILENT:

$(eval distroversion = $(shell cat terraform.tfvars  | grep -w 'distroversion =' | awk -F'"' '{ print $$2 }' ))
$(eval distro = $(shell cat terraform.tfvars  | grep distro | awk -F'"' '{ print $$2 }' ))
$(eval memory = $(shell cat terraform.tfvars  | grep memory | awk -F'"' '{ print $$2 }' ))
$(eval cpus = $(shell cat terraform.tfvars  | grep cpus | awk -F'"' '{ print $$2 }' ))
$(eval ip_address = $(shell cat terraform.tfvars  | grep ip_address | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_version = $(shell cat terraform.tfvars  | grep vagrant_cloud_version | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_username = $(shell cat terraform.tfvars  | grep vagrant_cloud_username | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_box_description = $(shell cat terraform.tfvars  | grep vagrant_cloud_box_description | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_box_short_description = $(shell cat terraform.tfvars  | grep vagrant_cloud_box_short_description | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_box_version_description = $(shell cat terraform.tfvars  | grep vagrant_cloud_box_version_description | awk -F'"' '{ print $$2 }' ))

all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

virtualbox: vagrant_clean vagrant_stop_all ## Build virtualbox image
	terraform init  && \
	terraform apply -state=.terraform.tfstate  -auto-approve

vagrant_up: ## Starts  vagrant box
	distroversion='$(distroversion)' distro='$(distro)' memory='$(memory)' cpus='$(cpus)' ip_address='$(ip_address)' vagrant up

vagrant_upload: ## Publish and release a new Vagrant Box on Vagrant Cloud
	vagrant cloud publish -f -r $(vagrant_cloud_username)/$(distro)-$(distroversion) $(vagrant_cloud_version) virtualbox $(distro)-$(distroversion)-x64-virtualbox.box \
	--description "$(distro)-$(distroversion) $(vagrant_cloud_box_description)" \
	--version-description "$(distro)-$(distroversion) $(vagrant_cloud_box_short_description)" \
	--distroversion --short-description "$(distro)-$(distroversion) $(vagrant_cloud_box_version_description)"

vagrant_reload: ## Starts  vagrant box
	distroversion='$(distroversion)' distro='$(distro)' memory='$(memory)' cpus='$(cpus)' ip_address='$(ip_address)' vagrant reload

vagrant_clean: ## Stop and remove current vagrant box
	distroversion='$(distroversion)' distro='$(distro)' memory='$(memory)' cpus='$(cpus)' ip_address='$(ip_address)' vagrant destroy -f 2>/dev/null; true && \
	vagrant box remove file://$(distro)-$(distroversion)-x64-virtualbox.box  2>/dev/null; true && \
	vagrant box list

vagrant_stop_all: ## Stop all Vagrant machines
	vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $$line; vagrant halt $$line; done;

vagrant_status: ## outputs status Vagrant environments for this user
	vagrant global-status
