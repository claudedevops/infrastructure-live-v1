
# create private route table az1 and add route through nat gateway az1
# terraform aws create route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az_1a.id
  }

  tags = {
    Name = "staging-private route table"
  }
}

# associate private subnet az1 with private route table az1
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private_subnet_az1_route_table_az1_association" {
  subnet_id      = aws_subnet.private_us_west_1a.id
  route_table_id = aws_route_table.private_route_table.id
}

# associate private subnet az2 with private route table az2
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private_subnet_az2_route_table_az2_association" {
  subnet_id      = aws_subnet.private_us_west_1b.id
  route_table_id = aws_route_table.private_route_table.id
}

# create route table and add public route
# terraform aws create route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "staging-public route table"
  }
}

# associate public subnet az1 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_us_west_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_2_route_table_association" {
  subnet_id      = aws_subnet.public_us_west_1b.id
  route_table_id = aws_route_table.public_route_table.id
}
