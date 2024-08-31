module "mongodb" {
  source = "terraform-aws-modules/ec2-instance/aws" #taking from terraform developed modules in their github
  name = "${local.ec2_name}-mongodb"
  ami = data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  key_name = "Virg"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
        component = "mongodb"
    },
    {
        Name = "${local.ec2_name}-mongodb"
    }
  )

}