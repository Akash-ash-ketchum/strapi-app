variable "key_name" {
  description = "SSH key pair name for EC2 instance"
  type        = string
}

variable "image_tag" {
  description = "Tag of the Docker image to deploy"
  type        = string
  default     = "latest"
}

