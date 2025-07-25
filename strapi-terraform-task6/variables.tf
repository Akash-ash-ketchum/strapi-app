variable "ecs_task_role_arn" {
  description = "IAM Role ARN for ECS tasks"
  type        = string
  default     = "arn:aws:iam::607700977843:role/ecs-task-execution-role"
}

variable "db_password" {
  description = "The password for the PostgreSQL admin user"
  type        = string
  sensitive   = true
}
