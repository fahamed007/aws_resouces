provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "test" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_route_table" "test" {
  vpc_id = aws_vpc.test.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "10.1.0.0/16"
    gateway_id = "local"
  }
}
