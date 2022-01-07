module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["tgw"]
  context    = module.this.context
}

data "aws_ec2_transit_gateway" "this" {
  count = local.enabled ? 1 : 0

  id = var.transit_gateway_id
}

data "hcp_hvn" "this" {
  count = local.enabled ? 1 : 0

  hvn_id = var.hcp_hvn_id
}

resource "aws_ram_resource_share" "this" {
  count = local.enabled ? 1 : 0

  name                      = module.label.id
  allow_external_principals = true
  tags                      = module.label.tags
}

resource "aws_ram_principal_association" "this" {
  count = local.enabled ? 1 : 0

  resource_share_arn = aws_ram_resource_share.this[0].arn
  principal          = data.hcp_hvn.this[0].provider_account_id
}

resource "aws_ram_resource_association" "this" {
  count = local.enabled ? 1 : 0

  resource_share_arn = aws_ram_resource_share.this[0].arn
  resource_arn       = data.aws_ec2_transit_gateway.this[0].arn
}

resource "hcp_aws_transit_gateway_attachment" "this" {
  count = local.enabled ? 1 : 0

  hvn_id                        = data.hcp_hvn.this[0].hvn_id
  transit_gateway_attachment_id = module.label.id
  transit_gateway_id            = data.aws_ec2_transit_gateway.this[0].id
  resource_share_arn            = aws_ram_resource_share.this[0].arn

  timeouts {
    create = var.create_timeout
    delete = var.delete_timeout
  }

  depends_on = [
    aws_ram_principal_association.this,
    aws_ram_resource_association.this
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "this" {
  count = local.enabled ? 1 : 0

  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.this[0].provider_transit_gateway_attachment_id
  tags                          = module.label.tags
}

locals {
  enabled = module.this.enabled
}
