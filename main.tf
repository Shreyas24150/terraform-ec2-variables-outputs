provider "aws" {
  region     = "eu-north-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0becc523130ac9d5d"
  instance_type = "t3.micro"

  tags = {
    Name = "TerraformEC2"
  }
}
