resource "aws_instance" "strapi" {
  ami                         = "ami-024e6efaf93d85776" # Ubuntu 22.04 in us-east-2
  instance_type               = "t3.micro"
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.strapi_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker

              docker pull akashashketchum/strapi-ec2:${var.image_tag}

              docker run -d \\
                -e APP_KEYS="Xj03KWr29cICctPUoOy0+47OYtv8jPAYfz0QqRkfFOo=,Aspj6+uBQIhBIrZ6XcSS+4n8bSo2iSIL70XNSTZ3y+k=" \\
                -e JWT_SECRET="PBjcs2ugc9REeBfaRtzKJw==" \\
                -e API_TOKEN_SALT="FJqGPovBQSTl9EgkiVCZjg==" \\
                -e ADMIN_JWT_SECRET="0fITtAu2brSz7KMyyIVG7i7YZpQ4vfUIOac8aXkx87c=" \\
                -e TRANSFER_TOKEN_SALT="WUxHxTh9fAAAXL6OQkigCWUUzwulak8sMDtVdLipqIY=" \\
                -e ENCRYPTION_KEY="5CfYNQzCl5HnkEKpLHWa9/+3FwmtlA97JYPHPP7XhjY=" \\
                -e FLAG_NPS=true \\
                -e FLAG_PROMOTE_EE=true \\
                -p 80:1337 \\
                akashashketchum/strapi-ec2:${var.image_tag}
              EOF

  tags = {
    Name = "akash-strapi-ec2"
  }
}

resource "aws_security_group" "strapi_sg" {
  name        = "akash-strapi-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
