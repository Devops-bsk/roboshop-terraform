data "aws_ami" "ubuntu" {
  owners = ["amazon"]
  most_recent = true
  
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}

data "aws_vpc" "default" {
  default = true
}
data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/vpn_sg_id"
}

# output "vpc_info" {
#   value = data.aws_subnet.selected.id

# }