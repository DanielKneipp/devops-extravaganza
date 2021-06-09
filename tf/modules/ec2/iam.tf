resource "aws_iam_role" "server" {
  name = "${var.prefix}-server-role"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_instance_profile" "server" {
  name = "${var.prefix}-server-instance-profile"
  role = aws_iam_role.server.name
}
