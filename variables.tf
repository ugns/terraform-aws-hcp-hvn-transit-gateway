variable "hcp_hvn_id" {
  type        = string
  description = "The ID of the HashiCorp Virtual Network (HVN)."
}

variable "transit_gateway_id" {
  type        = string
  description = "The ID of the user-owned transit gateway in AWS. The AWS region of the transit gateway must match the HVN."
}

variable "create_timeout" {
  type        = string
  description = "HVN transit gateway attachment create timeout. For more details, see https://www.terraform.io/docs/configuration/resources.html#operation-timeouts"
  default     = "3m"
}

variable "delete_timeout" {
  type        = string
  description = "HVN transit gateway attachment delete timeout. For more details, see https://www.terraform.io/docs/configuration/resources.html#operation-timeouts"
  default     = "5m"
}
