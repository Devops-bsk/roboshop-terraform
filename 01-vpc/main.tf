module "roboshop" {
  source = "../../terraform-aws-vpc" # if source is in local machine
  #if Source is in github 
  #source = "git::https://github.com/Devops-bsk/terraform_aws_vpc.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags

#public subnet
  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  database_subnets_cidr = var.database_subnets_cidr

  is_peering_required = var.is_peering_required
}