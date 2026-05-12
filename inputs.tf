variable "name" {
  description = "Block Volume display name."
  type        = string
}

variable "compartment_ocid" {
  description = "Compartment OCID where the Block Volume will be created."
  type        = string
}

variable "availability_domain" {
  description = "Availability domain name where the Block Volume will be created."
  type        = string
}

variable "size_in_gbs" {
  description = "Block Volume size in GB."
  type        = number
}

variable "vpus_per_gb" {
  description = "Performance tier in VPUs per GB. Valid values: 0, 10, 20, 30."
  type        = number
  default     = 10

  validation {
    condition     = contains([0, 10, 20, 30], var.vpus_per_gb)
    error_message = "vpus_per_gb must be one of: 0, 10, 20, 30."
  }
}

variable "defined_tags" {
  description = "Defined tags applied to created resources."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags applied to created resources."
  type        = map(string)
  default     = {}
}

variable "attach_to_instance" {
  description = "If true, attach the Block Volume to an OCI compute instance."
  type        = bool
  default     = false
}

variable "instance_id" {
  description = "Target OCI compute instance OCID. Required when attach_to_instance is true."
  type        = string
  default     = null
}

variable "attachment_type" {
  description = "Volume attachment type. v1 supports iscsi."
  type        = string
  default     = "iscsi"

  validation {
    condition     = contains(["iscsi"], var.attachment_type)
    error_message = "Only attachment_type = \"iscsi\" is supported in v1."
  }
}

variable "device" {
  description = "Optional device name requested for the volume attachment."
  type        = string
  default     = null
}

variable "is_agent_auto_iscsi_login_enabled" {
  description = "Enable Oracle Cloud Agent automatic iSCSI login/logout for iSCSI attachments."
  type        = bool
  default     = true
}

variable "is_read_only" {
  description = "Create the volume attachment in read-only mode."
  type        = bool
  default     = false
}

variable "is_shareable" {
  description = "Create the volume attachment in shareable mode."
  type        = bool
  default     = false
}

variable "use_chap" {
  description = "Use CHAP authentication for the iSCSI volume attachment."
  type        = bool
  default     = false
}
