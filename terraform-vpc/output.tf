output "vpc_id" {
	description = "ID of the VPC created"
	value = aws_vpc.my-vpc.id
}
