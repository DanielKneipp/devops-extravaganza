data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_security_group" "allow_outbound" {
  name        = "allow_outbount"
  description = "Allow outbound traffic"
  vpc_id      = data.aws_subnet.selected.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-allow-outboud"
  }
}
