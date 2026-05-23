data "oci_identity_availability_domains" "this" {
  compartment_id = coalesce(var.tenancy_ocid, var.compartment_ocid)
}

module "vcn" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-vcn.git"

  compartment_ocid = var.compartment_ocid
  name             = "fk-blockvolume-demo-vcn"
  vcn_cidr_blocks  = ["10.60.0.0/16"]

  create_internet_gateway = true

  route_tables = {
    public = {
      route_rules = [
        {
          destination        = "0.0.0.0/0"
          destination_type   = "CIDR_BLOCK"
          network_entity_key = "internet_gateway"
        }
      ]
    }
  }

  security_lists = {
    public_compute = {
      ingress_rules = [
        {
          protocol = "6"
          source   = "0.0.0.0/0"
          tcp_options = {
            min = 22
            max = 22
          }
        }
      ]
      egress_rules = [
        {
          protocol    = "all"
          destination = "0.0.0.0/0"
        }
      ]
    }
  }

  subnets = {
    public = {
      display_name               = "fk-blockvolume-public-subnet"
      cidr_block                 = "10.60.10.0/24"
      route_table_key            = "public"
      security_list_keys         = ["public_compute"]
      prohibit_public_ip_on_vnic = false
    }
  }
}
