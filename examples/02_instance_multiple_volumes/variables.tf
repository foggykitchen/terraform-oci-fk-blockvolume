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

variable "volume_name_prefix" {
  type    = string
  default = "fk-volume-demo"
}

variable "data_volumes" {
  type = map(object({
    size_in_gbs = number
    vpus_per_gb = number
  }))
  default = {
    data01 = {
      size_in_gbs = 100
      vpus_per_gb = 10
    }
    data02 = {
      size_in_gbs = 150
      vpus_per_gb = 20
    }
  }
}

variable "freeform_tags" {
  type    = map(string)
  default = {}
}
