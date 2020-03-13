provider "aws" {
  region                  = "us-east-2"
  version                 = "~> 2.0"
  shared_credentials_file = "/home/marzo/.aws/credentials"
  profile                 = "terraform"
}

resource "aws_vpc" "vpc_core" {
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "first_terraform"
  }
}

resource "aws_subnet" "dmz_t_a" {
  vpc_id     = "${aws_vpc.vpc_core.id}"
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "dmz_t_a"
  }
}

resource "aws_route_table" "route_p_t_a" {
  vpc_id = "${aws_vpc.vpc_core.id}"

  route {
    cidr_block = "10.1.1.0/24"
    gateway_id = "${aws_internet_gateway.gateway_t_a.id}"
  }

  tags = {
    Name = "route_p_t_a"
  }
}
