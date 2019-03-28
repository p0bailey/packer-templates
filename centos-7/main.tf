#Variables
variable "iso_checksum" {}

variable "iso_url" {}

variable "iso_checksum_type" {}

variable "guest_os_type" {}

variable "memory" {}

variable "cpus" {}

variable "distro" {}

variable "version" {}

data "template_file" "example" {
  template = "${file("template.tpl")}"

  vars {
    iso_checksum      = "${var.iso_checksum}"
    iso_url           = "${var.iso_url}"
    iso_checksum_type = "${var.iso_checksum_type}"
    guest_os_type     = "${var.guest_os_type}"
    memory            = "${var.memory}"
    cpus              = "${var.cpus}"
    distro            = "${var.distro}"
    version           = "${var.version}"
  }
}

resource "null_resource" "packer" {
  triggers {
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
