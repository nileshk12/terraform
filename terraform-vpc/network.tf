terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 6.0.0"
		}
	}
}

provider "aws" {
	region = "us-west-2"
	access_key = "AKIATX3PIDDSJ6CV6JZK"
	secret_key = "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"
}

resource "aws_subnet" "public_subnet" {
	vpc_id = aws_vpc.my_vpc.id
	cidr_block = var.public_subnet_cidr
	availability_zone = "us-west-2a"

	tags = {
		Name= "terraform_vpc_public_subnet"
	}
}

resource "aws_subnet" "private_subnet" {
	vpc_id = aws_vpc.my_vpc.id
	cidr_block = var.private_subnet_cidr
	availability_zone = "us-west-2a"

	tags = {
		Name = "terraform_vpc_private_subnet"
	}
}

resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.my_vpc.id

	tags = {
		Name = "terraform_igw"
	}
}

resource "aws_route_table" "rt_pub" {
	vpc_id = aws_vpc.my_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.igw.id
	}

	tags = {
		Name = "terraform_rt_public"
	}
}

resource "aws_route_table_association" "rt_pub_association" {
	subnet_id = aws_subnet.public_subnet.id
	route_table_id = aws_route_table.rt_pub.id
}

resource "aws_eip" "nat_eip" {
	domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
	allocation_id = aws_eip.nat_eip.id
	subnet_id = aws_subnet.public_subnet.id

	depends_on = [aws_eip.nat_eip, aws_subnet.public_subnet]
}

resource "aws_route_table" "rt-piv" {
	vpc_id = aws_vpc.my_vpc.id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.nat_gw.id
	}

	tags = {
		Name = "terraform_rt_private"
	}
}

resource "aws_route_table_association" "rt_priv_association" {
	subnet_id = aws_subnet.private_subnet.id
	route_table_id = aws_route_table.rt_piv.id
}