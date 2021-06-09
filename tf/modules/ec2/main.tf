resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  root_block_device {
    volume_size = 10
    encrypted   = true
  }

  iam_instance_profile   = aws_iam_instance_profile.server.name
  vpc_security_group_ids = [aws_security_group.allow_outbound.id]

  user_data = file("${path.module}/install-ssm-centos8.sh")

  tags = {
    Name = "${var.prefix}-server"
  }
}
