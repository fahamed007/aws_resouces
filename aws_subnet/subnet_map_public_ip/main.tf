provider "aws" {
  region = "ap-south-1"
}

data "aws_region" "current" {}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main subnet public1"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Main subnet private1"
  }
}

