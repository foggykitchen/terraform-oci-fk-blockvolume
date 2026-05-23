module "compute" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-compute.git"

  name             = "fk-oci-blockvolume-single"
  tenancy_ocid     = var.tenancy_ocid
  compartment_ocid = var.compartment_ocid
  subnet_id        = module.vcn.subnet_ids["public"]

  deployment_mode          = "instance"
  availability_domain      = var.availability_domain
  shape                    = "VM.Standard.E4.Flex"
  operating_system_version = "9"
  shape_config = {
    ocpus         = 1
    memory_in_gbs = 8
  }

  assign_public_ip = true
  ssh_authorized_keys = [
    tls_private_key.public_private_key_pair.public_key_openssh
  ]
  user_data = base64encode(templatefile("${path.module}/cloud-init.yaml.tftpl", {
    mount_point      = var.mount_point
    filesystem_label = var.filesystem_label
  }))
}
