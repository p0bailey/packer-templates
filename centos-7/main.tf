# Variables
variable "iso_checksum" {}

variable "iso_url" {}

variable "iso_name" {}

variable "guest_os_type" {}

variable "memory" {}

variable "cpus" {}

variable "distro" {}

variable "release" {}


data "template_file" "example" {
  template = "${file("template.tpl")}"

  vars = {
    iso_checksum  = "${var.iso_checksum}"
    iso_url       = "${var.iso_url}"
    iso_name      = "${var.iso_name}"
    guest_os_type = "${var.guest_os_type}"
    memory        = "${var.memory}"
    cpus          = "${var.cpus}"
    distro        = "${var.distro}"
    release       = "${var.release}"
  }
}

resource "null_resource" "packer" {
  triggers = {
    key = "${uuid()}"
  }

  provisioner "local-exec" {
    command = <<EOT
    rm -rf output-virtualbox-iso/  || true
    rm template.json || true
    echo '${data.template_file.example.rendered}' > template.json
    packer build template.json

    EOT
  }
}
