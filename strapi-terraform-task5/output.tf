output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.strapi.public_ip
}

output "docker_image_tag" {
  description = "Docker image tag used in this deployment"
  value       = var.image_tag
}
