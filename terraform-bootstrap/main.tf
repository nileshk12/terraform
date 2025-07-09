terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  access_key = "AKIATX3PIDDSJ6CV6JZK"
  secret_key = "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"
}

resource "aws_s3_bucket" "tf_state" {
	bucket = var.bucket_name
	tags = {
		Name = "terraform-tfstate"
		Environment = "bootstrap"
		}
}

resource "aws_s3_bucket_versioning" "versioning" {
	bucket = aws_s3_bucket.tf_state.id
	versioning_configuration {
		status = "Enabled"
	}
}

resource "aws_dynamodb_table" "tf_lock" {
	name = var.dynamodb_table_name
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "LockID"
	
	attribute {
		name = "LockID"
		type = "S"
	}
	tags = {
		Name = "terraform-locks"
		Environment = "bootstrap"
	}
}
