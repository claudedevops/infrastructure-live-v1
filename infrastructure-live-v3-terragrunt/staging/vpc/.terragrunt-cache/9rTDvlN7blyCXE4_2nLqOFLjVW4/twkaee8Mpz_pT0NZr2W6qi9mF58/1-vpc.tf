# If there's no more descriptive and general name available, OR
# if the resource module creates only one resource of this type,
# the resource name should be called "this"
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-main"
  }
}