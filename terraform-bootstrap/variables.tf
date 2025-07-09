variable "bucket_name" {
	description = "Name of s3 bucket for the state file"
	type = string
	default = "terraform-state-nilesh120791"
}

variable "dynamodb_table_name" {
	description = "Name of tfstate dynamodb table"
	type = string
	default = "terraform-locks"
}
