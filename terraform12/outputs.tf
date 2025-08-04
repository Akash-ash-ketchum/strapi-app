output "strapi_alb_url" {
  description = "Public URL of the Strapi application"
  value       = "http://${aws_lb.strapi_alb.dns_name}"
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.strapi_postgres.address
}

output "image_used" {
  value = "607700977843.dkr.ecr.us-east-2.amazonaws.com/akash-strapi-ecr:${var.image_tag}"
}
