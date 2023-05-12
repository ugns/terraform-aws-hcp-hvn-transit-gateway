terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.21.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.76.1"
    }
  }

  required_version = ">= 0.13"
}
