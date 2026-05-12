variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "region" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "availability_domain" {
  type    = string
  default = null
}

variable "volume_name" {
  type    = string
  default = "fk-volume-demo-01"
}

variable "volume_size_in_gbs" {
  type    = number
  default = 100
}

variable "vpus_per_gb" {
  type    = number
  default = 10
}

variable "freeform_tags" {
  type    = map(string)
  default = {}
}

variable "mount_point" {
  type    = string
  default = "/u01"
}

variable "filesystem_label" {
  type    = string
  default = "u01"
}
