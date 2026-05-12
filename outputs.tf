output "volume_id" {
  description = "Block Volume OCID."
  value       = oci_core_volume.this.id
}

output "volume_display_name" {
  description = "Block Volume display name."
  value       = oci_core_volume.this.display_name
}

output "volume_size_in_gbs" {
  description = "Block Volume size in GB."
  value       = oci_core_volume.this.size_in_gbs
}

output "vpus_per_gb" {
  description = "Performance tier in VPUs per GB."
  value       = oci_core_volume.this.vpus_per_gb
}

output "attached_to_instance" {
  description = "True if the Block Volume was attached to an instance."
  value       = length(oci_core_volume_attachment.this) > 0
}

output "attachment_type" {
  description = "Attachment type used for the Block Volume attachment."
  value       = var.attach_to_instance ? var.attachment_type : null
}

output "attachment_device" {
  description = "Resolved device name for the Block Volume attachment."
  value       = try(oci_core_volume_attachment.this[0].device, null)
}

output "attachment_ipv4" {
  description = "iSCSI IPv4 address exported by the attachment."
  value       = try(oci_core_volume_attachment.this[0].ipv4, null)
}

output "attachment_port" {
  description = "iSCSI port exported by the attachment."
  value       = try(oci_core_volume_attachment.this[0].port, null)
}

output "attachment_iqn" {
  description = "iSCSI IQN exported by the attachment."
  value       = try(oci_core_volume_attachment.this[0].iqn, null)
}
