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