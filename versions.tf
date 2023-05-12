terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.56.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }

  required_version = ">= 0.13"
}
