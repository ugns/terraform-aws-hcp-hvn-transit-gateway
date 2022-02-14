output "hcp_hvn_target_link" {
  description = "A unique URL identifying the HVN route."
  value       = join("", hcp_aws_transit_gateway_attachment.this.*.self_link)
}
