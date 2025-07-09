variable "vpc_cidr" {
	description = "CIDR block for VPC"
	type = string
	default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
	description = "CIDR block for public subnet"
	type = string
	default = "10.0.1.0/28"
}

variable "private_subnet_cidr" {
	description = "CIDR block for private subnet"
	type = string
	default = "10.0.2.0/28"
}