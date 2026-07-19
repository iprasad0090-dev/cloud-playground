resource "aws_instance" "app" {

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.app_instance_type
  subnet_id = values(aws_subnet.private_app)[0].id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name                    = var.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  associate_public_ip_address = false

  user_data = <<EOF
#!/bin/bash
dnf update -y
dnf install -y java-21-amazon-corretto
EOF

  # Add this block
  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  # Add this block
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-app"
  })
}