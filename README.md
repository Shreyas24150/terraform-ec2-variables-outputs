# 🚀 Terraform AWS EC2 Setup (WSL + VS Code)

This project demonstrates how to launch an AWS EC2 instance using **Terraform** from **Windows Subsystem for Linux (WSL)** inside **VS Code**.
---

## In this there are
- Terraform `main.tf` to deploy an EC2 instance
- AWS Provider configuration
- Secure key handling (via AWS CLI or direct keys)
- Tested in **Ubuntu WSL1 on Windows 11 + VS Code**

---

## Prerequisites

- ✅ AWS Account
- ✅ AWS IAM Access Key & Secret Key
- ✅ WSL1 with Ubuntu installed
- ✅ VS Code with WSL extension
- ✅ Terraform installed inside WSL

---

## ⚙️ Setup & Usage

1. **Clone the repo or create the project folder**
   ```bash
   mkdir terraform-ec2 && cd terraform-ec2
   code .
   ```

2. **Install Terraform in WSL**
```
sudo apt update && sudo apt install terraform
terraform -version
```

3. **Configure AWS**
Method 1 - Hardcoded keys in main.tf(Not secure for production)
```
provider "aws" {
  region     = "ap-south-1"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```

Method 2 - Use AWS CLI (recommended)
```
sudo apt install awscli
aws configure
```

Then update main.tf to 
```
provider "aws" {
  region = "ap-south-1"
}
```

4. **Terraform Command**
```
terraform init     # Initializes the working directory
terraform plan     # Shows what will be created
terraform apply    # Provisions EC2 instance
```

5. **Destroy resources (cleanup)**
```
terraform destroy
```

## EC2 Specs

Region: eu-north-1

AMI: ami-0becc523130ac9d5d (Ubuntu 22.04)

Instance Type: t3.micro

Tag: "Name" = "TerraformEC2"

## Folder Structure
```
terraform-ec2/
├── main.tf
└── README.md
```

## Notes
```
Never commit your access keys to GitHub
Use .gitignore for .terraform/ and sensitive files
Tested on WSL1 Ubuntu 20.04
```


