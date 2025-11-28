provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "test" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.test.id

  route = []

  tags = {
    Name = "example"
  }
}
