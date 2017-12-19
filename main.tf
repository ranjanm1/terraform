provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "example" {
  ami             = "ami-e7d6c983"
  instance_type   = "t2.micro"

  tags {
    name = "terraform-example"
  }
}
