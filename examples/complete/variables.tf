variable "hvn_region" {
  type        = string
  description = "The AWS region where you want to deploy your HCP clusters."
  default     = "us-east-1"
}

variable "transit_gateway_id" {
  type        = string
  description = "The ID of the user-owned transit gateway in AWS. The AWS region of the transit gateway must match the HVN."
  default     = null
}
