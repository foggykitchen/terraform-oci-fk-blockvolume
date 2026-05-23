# terraform-oci-fk-blockvolume

This repository contains a reusable **Terraform / OpenTofu module** and
progressive examples for deploying **Oracle Cloud Infrastructure (OCI)
Block Volumes** and attaching them to **Compute Instances** in a clean,
explicit, and architecture-aware way.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is
designed as a dedicated **storage persistence layer** for OCI compute
workloads.

---

## Purpose

The goal of this repository is to provide a **clear, educational, and
composable reference implementation** for **OCI Block Volumes** using
Infrastructure as Code.

It focuses on:

- OCI Block Volumes as **first-class resources**
- Explicit volume creation and attachment
- Separation between **boot volumes** and **data volumes**
- Persistence boundaries at the Compute Instance level
- Clean Terraform/OpenTofu modeling of volume lifecycles

This is **not** a landing zone, platform framework, or full compute
solution. It is a **learning-first building block** that integrates with
other FoggyKitchen modules.

---

## What the module does

Depending on configuration and example used, the module can:

- Create OCI **Block Volumes**
- Control volume size and performance tier (`vpus_per_gb`)
- Attach data volumes explicitly to **OCI Compute Instances**
- Optionally enable **Oracle Cloud Agent** automatic iSCSI login for attached volumes
- Expose volume identifiers and attachment state as outputs

The module intentionally does **not** create or manage:

- Compute Instances themselves
- Boot Volumes
- VCNs or subnets
- NSGs or security lists
- Load Balancers
- Backups or clones
- Volume groups

Each of those concerns belongs in its own dedicated module.

---

## Repository Structure

```bash
terraform-oci-fk-blockvolume/
├── examples/
│   ├── 01_instance_single_volume/
│   ├── 02_instance_multiple_volumes/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

---

## Example Usage

```hcl
module "data_volume" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-blockvolume.git?ref=v0.1.0"

  name                = "fk-blockvolume-data01"
  compartment_ocid    = var.compartment_ocid
  availability_domain = var.availability_domain

  size_in_gbs = 100
  vpus_per_gb = 10

  attach_to_instance = true
  instance_id        = module.compute.instance_id
  is_agent_auto_iscsi_login_enabled = true

  freeform_tags = {
    project = "foggykitchen"
    env     = "dev"
  }
}
```

---

## Outputs

| Output | Description |
|------|-------------|
| `volume_id` | OCID of the created Block Volume. |
| `volume_display_name` | Display name of the Block Volume. |
| `volume_size_in_gbs` | Size of the Block Volume in GB. |
| `vpus_per_gb` | Selected Block Volume performance tier. |
| `attached_to_instance` | Indicates whether the volume is attached to a Compute Instance. |
| `attachment_type` | Attachment type used for the volume attachment. |
| `attachment_device` | Resolved device name for the volume attachment. |
| `attachment_ipv4` | iSCSI IPv4 address exported by the attachment. |
| `attachment_port` | iSCSI port exported by the attachment. |
| `attachment_iqn` | iSCSI IQN exported by the attachment. |

---

## Design Philosophy

- Persistence starts with **Block Volumes**, not the guest filesystem
- Volume attachment must be **explicit and visible**
- One module = one responsibility
- Examples teach **patterns**, not just syntax
- Terraform code should reflect OCI's real resource model
- Storage and compute lifecycles are **deliberately separated**

This repository intentionally avoids abstraction layers that hide how
OCI block storage actually behaves.

---

## Related Modules & Training

- [terraform-oci-fk-vcn](https://github.com/foggykitchen/terraform-oci-fk-vcn)
- [terraform-oci-fk-compute](https://github.com/foggykitchen/terraform-oci-fk-compute)
- [terraform-oci-fk-filestorage](https://github.com/foggykitchen/terraform-oci-fk-filestorage)
- [terraform-az-fk-disk](https://github.com/mlinxfeld/terraform-az-fk-disk)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 FoggyKitchen.com - Cloud. Code. Clarity.
