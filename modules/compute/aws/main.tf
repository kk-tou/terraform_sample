resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.project_name}-ec2-sg"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allowing SSM-related traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS for SSM"
  }
}

resource "aws_instance" "private_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = element(var.private_subnet_ids, 0)
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = false

  # Enabling access via AWS Systems Manager
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  # Set root block device to 30 GB
  root_block_device {
    volume_size = 30  # Set the root volume to 30 GB
    volume_type = "gp3"  # Optionally specify volume type, default is gp2
  }

  tags = {
    Name = "${var.project_name}-private-ec2"
  }
}

resource "aws_iam_role" "ssm_role" {
  name = "${var.project_name}-ssm-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = { Service = "ec2.amazonaws.com" }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_managed_policy" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.project_name}-ssm-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_iam_role_policy" "ssm_kms_policy" {
  name = "${var.project_name}-ssm-kms-policy"
  role = aws_iam_role.ssm_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = "kms:Decrypt",
        Resource = var.ssm_kms_key_arn
      }
    ]
  })
}

