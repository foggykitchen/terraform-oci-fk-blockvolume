output "instance_id" {
  value = module.compute.instance_id
}

output "instance_private_ip" {
  value = module.compute.instance_private_ip
}

output "instance_public_ip" {
  value = module.compute.instance_public_ip
}

output "volume_ids" {
  value = { for key, module_ref in module.data_volume : key => module_ref.volume_id }
}

output "volume_sizes_in_gbs" {
  value = { for key, module_ref in module.data_volume : key => module_ref.volume_size_in_gbs }
}

output "ssh_private_key_pem" {
  value     = tls_private_key.public_private_key_pair.private_key_pem
  sensitive = true
}
