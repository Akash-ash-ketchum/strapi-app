output "strapi_alb_url" {
  description = "Public URL of the Strapi application"
  value       = "http://${aws_lb.strapi_alb.dns_name}"
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.strapi_postgres.address
}
