provider "aws" {
  #access_key = "${var.access_key}"
  #secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "web-lon-1" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.aws_instance_type}"
  security_groups = ["${var.aws_security_group}"]
  key_name = "${var.aws_key_name}"
  user_data = "${file("london-web1-userdata.sh")}"
  tags {
    Name = "londonweb1"
  }
}

resource "aws_instance" "web-lon-2" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.aws_instance_type}"
  security_groups = ["${var.aws_security_group}"]
  key_name = "${var.aws_key_name}"
  user_data = "${file("london-web2-userdata.sh")}"
  tags {
    Name = "londonweb2"
  }
}

resource "aws_lb" "prithiv-elb-london" {
  name            = "prithiv-elb-london"
  internal        = false
  load_balancer_type = "application"
#  security_groups = ["${var.aws_security_group.lb_sg.id}"]
  security_groups = ["sg-1cda4e74"]
  subnets         = ["subnet-678b0d2a", "subnet-bb563cc0"]
  enable_deletion_protection = false

#  access_logs {
#    bucket = "${aws_s3_bucket.lb_logs.bucket}"
#    prefix = "test-lb"
#  }

  tags {
    Environment = "production"
  }
}
