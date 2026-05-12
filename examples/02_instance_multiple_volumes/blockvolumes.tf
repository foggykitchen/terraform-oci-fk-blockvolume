module "data_volume" {
  for_each = var.data_volumes
  source   = "../.."

  name                = "${var.volume_name_prefix}-${each.key}"
  compartment_ocid    = var.compartment_ocid
  availability_domain = coalesce(var.availability_domain, data.oci_identity_availability_domains.this.availability_domains[0].name)

  size_in_gbs = each.value.size_in_gbs
  vpus_per_gb = each.value.vpus_per_gb

  attach_to_instance                = true
  instance_id                       = module.compute.instance_id
  is_agent_auto_iscsi_login_enabled = false
  freeform_tags                     = var.freeform_tags
}
