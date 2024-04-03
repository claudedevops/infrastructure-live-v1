# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
# terraform aws allocate elastic ip
resource "aws_eip" "this" {
  vpc = true

  tags = {
    Name = "${var.env}-nat-eip"
  }
}

# NOTE: In production the standard is to create 2 eip and 2 nat gateways for the 2 AZs for high availability and fault tolerance

# create nat gateway in public subnet az1
# terraform create aws nat gateway
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.env}-nat-gateway"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc.
  depends_on = [aws_internet_gateway.this]
}

