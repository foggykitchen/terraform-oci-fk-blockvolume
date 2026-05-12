# Example 02: Single Instance with Multiple Block Volumes

This example extends the first pattern into a **map-driven multi-volume
deployment**: one VCN, one compute instance, multiple block volumes, and
multiple explicit attachments created with `for_each`.

The goal is to show how the module scales cleanly when a single workload
needs more than one persistent data volume.

---

## Architecture Overview

This deployment creates:

- one dedicated **VCN**
- one **public subnet**
- one **OCI Compute Instance**
- multiple **OCI Block Volumes**
- one explicit **attachment per volume**

---

## Deployment Steps

Initialize and apply the Terraform/OpenTofu configuration:

```bash
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

If you prefer Terraform:

```bash
terraform init
terraform plan
terraform apply
```

After a successful deployment, Terraform will output:

- the compute instance ID
- the private and public IP
- a map of block volume IDs
- a map of block volume sizes
- a generated SSH private key marked as sensitive

The example generates a temporary **RSA 4096** SSH key pair with the
`tls` provider and injects the public key into the compute instance so
the host is immediately reachable after deployment.

---

## What This Example Demonstrates

- how to create multiple OCI Block Volumes with `for_each`
- how to attach multiple volumes to one compute instance
- how to keep storage definitions explicit with a map input
- how to reuse the same network and compute building blocks from example 01

---

## Cleanup

To remove all resources created by this example:

```bash
tofu destroy
```

Or with Terraform:

```bash
terraform destroy
```

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../../LICENSE) for more details.
