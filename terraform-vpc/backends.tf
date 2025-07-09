terraform {
	backend "s3" {
		bucket = "terraform-state-nilesh120791"
		key = "vpc/terraform.tfstate"
		region = "us-west-2"
		access_key = "AKIATX3PIDDSJ6CV6JZK"
                secret_key = "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"
		use_lockfile = true
		encrypt = true
	}
}
