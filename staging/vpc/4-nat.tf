# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
# terraform aws allocate elastic ip
resource "aws_eip" "eip_for_nat_gateway" {
  vpc = true

  tags = {
    Name = "nat gateway eip"
  }
}

# NOTE: In production the standard is to create 2 eip and 2 nat gateways for the 2 AZs for high availability and fault tolerance

# create nat gateway in public subnet az1
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat_gateway_az_1a" {
  allocation_id = aws_eip.eip_for_nat_gateway.id
  subnet_id     = aws_subnet.public_us_west_1a.id

  tags = {
    Name = "staging-nat gateway"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc.
  depends_on = [aws_internet_gateway.igw]
}

