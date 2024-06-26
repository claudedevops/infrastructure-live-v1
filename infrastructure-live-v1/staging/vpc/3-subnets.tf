resource "aws_subnet" "private_us_west_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-west-1a"

  tags = {
    "Name"                               = "staging-private-us-west-1a"
    "kubernetes.io/role/internal-elb"    = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}

resource "aws_subnet" "private_us_west_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-west-1b"

  tags = {
    "Name"                               = "staging-private-us-west-1b"
    "kubernetes.io/role/internal-elb"    = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}

resource "aws_subnet" "public_us_west_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                               = "staging-public-us-west-1a"
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}

resource "aws_subnet" "public_us_west_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                               = "staging-public-us-west-1b"
    "kubernetes.io/role/elb"             = "1"
    "kubernetes.io/cluster/staging-demo" = "owned"
  }
}