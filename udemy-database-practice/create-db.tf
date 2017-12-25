provider "aws" {
  region     = "${var.region}"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6.37"
  instance_class       = "db.t2.micro"
  name                 = "acloudguru"
  username             = "acloudguru"
  password             = "acloudguru"
#  db_subnet_group_name = "my_database_subnet_group"
#  parameter_group_name = "default.mysql5.6"
}
resource "aws_instance" "web-lon-1" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.aws_instance_type}"
  security_groups = ["${var.aws_security_group}"]
  key_name = "${var.aws_key_name}"
  user_data = "${file("rds.sh")}"
  tags {
    Name = "londonweb1"
  }
}
