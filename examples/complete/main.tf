data "aws_vpc" "default" {
  default = true
}

module "hcp_hvn" {
  source = "ugns/hcp-hvn/aws"
  # version = "x.x.x"

  hvn_region = var.hvn_region

  context = module.label.this
}

module "example" {
  source = "../.."
  # source = "ugns/hcp-hvn-peering-connection/aws"
  # version = "x.x.x"

  hcp_hvn_id         = module.hcp_hvn.hcp_hvn_id
  transit_gateway_id = var.transit_gateway_id

  context = module.label.this
}
