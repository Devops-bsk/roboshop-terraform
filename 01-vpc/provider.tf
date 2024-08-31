terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.31.0"
    }
  }
backend "s3" {
  bucket = "mybucket-bsk-terr-state"
  key = "vpc"
  region = "us-east-1"
  dynamodb_table = "terr-locking"
}
}
provider "aws" {
  region = "us-east-1"
}
