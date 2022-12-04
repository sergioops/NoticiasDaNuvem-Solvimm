provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "state-terraform-sap"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}