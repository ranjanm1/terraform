#variable "access_key" {}
#variable "secret_key" {}
variable "region" {
  default = "eu-west-2"
}
variable "aws_ami" {
  default = "ami-e7d6c983"
}
variable "aws_instance_type" {
  default = "t2.micro"
}
variable "aws_security_group" {
  default = "webserver-sg1"
}
variable "aws_key_name" {
  default = "ranjan-linux"
}
