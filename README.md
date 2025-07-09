# Terraform AWS VPC Infrastructure (WIP)

This repository provisions foundational AWS infrastructure using Terraform.

## 📦 Components

### 1. `terraform-bootstrap/`
Bootstraps remote state backend using:
- 🪣 S3 bucket (for storing `.tfstate`)
- 🧮 DynamoDB table (for state locking)

### 2. `terraform-vpc/`
Creates the core networking stack:
- VPC with CIDR block
- Public and private subnets
- Internet Gateway + NAT Gateway
- Route tables and associations

## 📁 Folder Structure
```
terraform/
├── terraform-bootstrap/
│ ├── main.tf
│ ├── variables.tf
│ └── output.tf
├── terraform-vpc/
│ ├── backends.tf
│ ├── main.tf
│ ├── network.tf
│ ├── variables.tf
│ └── output.tf
└── .gitignore
```
## ⚙️ How to Use

**Step 1: Clone the repo**
```
git clone <Repo url>
cd terraform/terraform-bootstrap
```

**Step 2: Bootstrap the backend**

```
terraform init
terraform apply
````
**Step 3: Deploy the VPC**
```
cd ../terraform-vpc
terraform init
terraform apply
```
⏳**Work in Progress**


**Features to be added:**

Bastion (Jump Host) EC2 in public subnet

Private EC2 instance with no public IP

SSH access to private EC2 only via Bastion

**Security Best Practices**

.tfstate, .tfvars, and sensitive files are .gitignore-ed

AWS credentials should not be stored in Terraform code

Use environment variables or a credentials file for auth

👨‍💻 **Author**

Nilesh Kundu

Beginner Terraform + DevOps practitioner, building infrastructure from scratch and learning deeply along the way.
