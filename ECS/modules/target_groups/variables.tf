variable "target_group_name" {
  description = "Name of the target group"
  type        = string  
}
variable "vpc_id" {
  description = "VPC ID where the target group will be created"
  type        = string  
}
variable "container_port" {
  description = "Port on which the container listens"
  type        = number
  default     = 80
}
variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/healthz"  
}

