resource "aws_security_group" "bastion" {

  name        = "${var.project_name}-${var.environment}-bastion-sg"
  description = "Security Group for Bastion Host"

  vpc_id = aws_vpc.this.id

  ingress {

    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-bastion-sg"
    }
  )
}

resource "aws_security_group" "app" {

  name        = "${var.project_name}-${var.environment}-app-sg"
  description = "Application EC2"

  vpc_id = aws_vpc.this.id

  ingress {

    description = "SSH from Bastion"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    security_groups = [
      aws_security_group.bastion.id
    ]
  }

  ingress {

    description = "Application Port"

    from_port = 8080
    to_port   = 8080

    protocol = "tcp"

    security_groups = [
      aws_security_group.bastion.id
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-app-sg"
    }
  )
}