module "data_volume" {
  source = "../.."

  name                = var.volume_name
  compartment_ocid    = var.compartment_ocid
  availability_domain = coalesce(var.availability_domain, data.oci_identity_availability_domains.this.availability_domains[0].name)

  size_in_gbs = var.volume_size_in_gbs
  vpus_per_gb = var.vpus_per_gb

  attach_to_instance                = true
  instance_id                       = module.compute.instance_id
  is_agent_auto_iscsi_login_enabled = false
  freeform_tags                     = var.freeform_tags
}
