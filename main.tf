locals {
  instance_ok = (!var.attach_to_instance) || (var.attach_to_instance && var.instance_id != null)
}

resource "oci_core_volume" "this" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = var.name
  size_in_gbs         = var.size_in_gbs
  vpus_per_gb         = var.vpus_per_gb
  defined_tags        = var.defined_tags
  freeform_tags       = var.freeform_tags

  lifecycle {
    precondition {
      condition     = local.instance_ok
      error_message = "attach_to_instance=true requires instance_id."
    }
  }
}

resource "oci_core_volume_attachment" "this" {
  count = var.attach_to_instance ? 1 : 0

  attachment_type                   = var.attachment_type
  device                            = var.device
  instance_id                       = var.instance_id
  is_agent_auto_iscsi_login_enabled = var.is_agent_auto_iscsi_login_enabled
  is_read_only                      = var.is_read_only
  is_shareable                      = var.is_shareable
  use_chap                          = var.use_chap
  volume_id                         = oci_core_volume.this.id
}
