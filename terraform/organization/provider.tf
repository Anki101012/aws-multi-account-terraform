terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.36"
    }
  }

  backend "s3" {
    bucket         = "helixcloud-tf-state-39xxxxxx"
    key            = "organization/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "TerraformStateLock"
    encrypt        = true
  }

}

provider "aws" {
  region = "us-east-1"
}
