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

resource "aws_vpc" "my_vpc" {
	cidr_block = var.vpc_cidr
	enable_dns_support = true
	enable_dns_hostnames = true
	
	tags = {
		Name = "my-terrraform-vpc"
	}
}
