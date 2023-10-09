
provider "aws" {
  profile = "default"
  region = "eu-central-1"
}

resource "aws_default_vpc" "default" {}

resource "aws_subnet" "redhat9_103" {
  vpc_id     = aws_default_vpc.default.id
  cidr_block = "172.31.103.0/24"

  tags = {
    Name = "redhat9_103"
    "Terraform" = "true"
  }
}

resource "aws_security_group" "redhat9_sg"{
  name = "redhat9_sg"
  description = " allows standard http y https ports inbound"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.whitelist
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
    cidr_blocks = ["172.31.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    ="-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = { 
  "Terraform" = "true"
  }
}

