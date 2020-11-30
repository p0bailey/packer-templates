#Authored by Phillip Bailey
.PHONY: all virtualbox  vagrant_up  vagrant_clean vagrant_stop_all vagrant_status
.SILENT:

VARIABLES = variables.pkrvars.hcl

$(eval release = $(shell cat $(VARIABLES)  | grep -w 'release =' | awk -F'"' '{ print $$2 }' ))
$(eval distro = $(shell cat $(VARIABLES)  | grep distro | awk -F'"' '{ print $$2 }' ))
$(eval memory = $(shell cat $(VARIABLES)  | grep memory | awk -F'"' '{ print $$2 }' ))
$(eval cpus = $(shell cat $(VARIABLES)  | grep cpus | awk -F'"' '{ print $$2 }' ))
$(eval ip_address = $(shell cat $(VARIABLES)  | grep ip_address | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_version = $(shell cat $(VARIABLES)  | grep vagrant_cloud_version | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_username = $(shell cat $(VARIABLES)  | grep vagrant_cloud_username | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_box_description = $(shell cat $(VARIABLES)  | grep vagrant_cloud_box_description | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_box_short_description = $(shell cat $(VARIABLES)  | grep vagrant_cloud_box_short_description | awk -F'"' '{ print $$2 }' ))
$(eval vagrant_cloud_box_version_description = $(shell cat $(VARIABLES)  | grep vagrant_cloud_box_version_description | awk -F'"' '{ print $$2 }' ))

all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


virtualbox: ## Build virtualbox
	packer build -var-file=variables.pkrvars.hcl template.json.pkr.hcl


vagrant_up: ## Starts  vagrant box
	release='$(release)' distro='$(distro)' memory='$(memory)' cpus='$(cpus)' ip_address='$(ip_address)' vagrant up

vagrant_provision: ## Provision an existing vagrant Box.
	vagrant ssh -- -t  'sudo /vagrant/scripts/provision.sh'

vagrant_upload: ## Publish and release a new Vagrant Box on Vagrant Cloud
	vagrant cloud publish -f -r $(vagrant_cloud_username)/$(distro)-$(release) $(vagrant_cloud_version) virtualbox $(distro)-$(release)-x64-virtualbox.box \
	--description "$(distro)-$(release) $(vagrant_cloud_box_description)" \
	--version-description "$(distro)-$(release) $(vagrant_cloud_box_short_description)" \
	--release --short-description "$(distro)-$(release) $(vagrant_cloud_box_version_description)"

vagrant_reload: ## Start  vagrant box
	release='$(release)' distro='$(distro)' memory='$(memory)' cpus='$(cpus)' ip_address='$(ip_address)' vagrant reload

vagrant_version: ## Get the latest cloud vagrant_version
	curl -s https://app.vagrantup.com/$(vagrant_cloud_username)/boxes/$(distro)-$(release) |  jq -r '.versions[0] .version'

vagrant_clean: ## Stop and remove current vagrant box
	release='$(release)' distro='$(distro)' memory='$(memory)' cpus='$(cpus)' ip_address='$(ip_address)' vagrant destroy -f 2>/dev/null; true && \
	vagrant box remove file://$(distro)-$(release)-x64-virtualbox.box  2>/dev/null; true && \
	vagrant box list

vagrant_stop_all: ## Stop all Vagrant machines
	vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $$line; vagrant halt $$line; done;

vagrant_status: ## outputs status Vagrant environments for this user
	vagrant global-status
