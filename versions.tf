terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.21.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }

  required_version = ">= 0.13"
}
