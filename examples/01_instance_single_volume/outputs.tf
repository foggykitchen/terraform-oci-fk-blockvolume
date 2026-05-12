output "instance_id" {
  value = module.compute.instance_id
}

output "instance_private_ip" {
  value = module.compute.instance_private_ip
}

output "instance_public_ip" {
  value = module.compute.instance_public_ip
}

output "volume_id" {
  value = module.data_volume.volume_id
}

output "volume_size_in_gbs" {
  value = module.data_volume.volume_size_in_gbs
}

output "attachment_device" {
  value = module.data_volume.attachment_device
}

output "attachment_ipv4" {
  value = module.data_volume.attachment_ipv4
}

output "ssh_private_key_pem" {
  value     = tls_private_key.public_private_key_pair.private_key_pem
  sensitive = true
}
