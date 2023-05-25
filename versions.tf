terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.21.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }

  required_version = ">= 0.13"
}
