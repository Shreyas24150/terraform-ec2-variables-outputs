# Terraform AWS EC2 Automation with Variables & Outputs

Made Terraform EC2 setup with dynamic, reusable, and modular

---

## In this there are
```
| Concept             | Purpose                         |
| ------------------- | ------------------------------- |
| `variables.tf`      | Replace hardcoded values        |
| `terraform.tfvars`  | Separate file for actual values |
| `outputs.tf`        | Print useful info after deploy  |
| `terraform fmt`     | Format and clean up code        |
| `terraform destroy` | Clean teardown                  |
```

---

## ⚙️ Setup & Usage

## Folder Structure
```
terraform-ec2/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```
## 1. Create variables.tf
```
variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for EC2"
  default     = "ami-0f58b397bc5c1f2e8"
}

variable "instance_name" {
  description = "Tag for EC2"
  default     = "Terraform-EC2"
}
```
**Note**
In this file we have created different variables like region, instance_type, ami, instance_name.
We can use this variables in files like main.tf.

## 2. Update main.tf
```
provider "aws" {
  region = var.region
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
```
**Note**
We have used the variables region, instance_type, ami, instance_name in this file by writing var.region, var.ami, var.instance_type, var.instance_name.


## 3. Create terraform.tfvars
```
region         = "ap-south-1"
instance_type  = "t2.micro"
ami            = "ami-0f58b397bc5c1f2e8"
instance_name  = "Shreyas-Auto-EC2"
```
**Note**
In this file we have defined actual values for the input variables declared in variables.tf


## 4. Create outputs.tf
```
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.myec2.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.myec2.public_ip
}
```
**Note**
This file display the deployed instance's id and pubilc id after terraform apply

## 5. Run the project
```
terraform fmt          # clean formatting
terraform init
terraform plan
terraform apply
```

**You’ll see:**

```
Outputs:

instance_id = "i-0abc123456789"
public_ip   = "13.234.45.67"
```

## Notes
```
Never commit your access keys to GitHub
Use .gitignore for .terraform/ and sensitive files
Tested on WSL1 Ubuntu 20.04
```
