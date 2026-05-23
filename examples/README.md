# OCI Block Volume with Terraform/OpenTofu - Training Examples

This directory contains runnable examples for the
**terraform-oci-fk-blockvolume** module.
The examples focus on practical OCI Block Volume deployment patterns,
starting with a single volume attached to one instance and then
expanding to multiple data volumes on the same compute node.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are
designed to show how OCI Block Volumes fit into compute and network
architectures.

---

## Published Examples

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Single Instance with Single Block Volume** | basic VCN, one compute instance, one block volume, explicit attachment |
| 02 | **Single Instance with Multiple Block Volumes** | reusable map-based volume definitions, one compute instance, multiple attachments |

---

## How to Use

To run the single-volume example:

```bash
cd examples/01_instance_single_volume
tofu init
tofu plan
tofu apply
```

To run the multi-volume example:

```bash
cd examples/02_instance_multiple_volumes
tofu init
tofu plan
tofu apply
```

If you prefer Terraform, replace `tofu` with `terraform`.

---

## Design Principles

- One example = one storage architecture goal
- Volume creation stays explicit, because OCI block storage is a separate lifecycle from compute
- Examples stay focused on Block Volumes and use `terraform-oci-fk-vcn` and `terraform-oci-fk-compute` only for surrounding infrastructure
- Each example is runnable and progressively expands the storage pattern

---

## Related Resources

- [FoggyKitchen OCI Block Volume Module (terraform-oci-fk-blockvolume)](../)
- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/foggykitchen/terraform-oci-fk-vcn)
- [FoggyKitchen OCI Compute Module (terraform-oci-fk-compute)](https://github.com/foggykitchen/terraform-oci-fk-compute)
- [FoggyKitchen Azure Managed Disk Module (terraform-az-fk-disk)](https://github.com/mlinxfeld/terraform-az-fk-disk)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
