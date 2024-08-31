module "vpn" {
  source = "terraform-aws-modules/ec2-instance/aws" #taking from terraform developed modules in their github
  name = "${local.ec2_name}-vpn"
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "Virg"
  user_data = file("openvpn.sh")
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id = data.aws_subnet.selected.id
  tags = merge(
    var.common_tags,
    {
        component = "vpn"
    },
    {
        Name = "${local.ec2_name}-vpn"
    }
  )

}