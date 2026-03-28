variable "ecs_service_name" {
    description = "The name of the ECS service"
    type        = string
    default     = "pihire-ecs-service"  # Default value for ECS service name
  
}
variable "ecs_cluster_name" {
    description = "The name of the ECS cluster"
    type        = string
    default     = "pihire-ecs-cluster"  # Default value for ECS cluster name
}
variable "subnet_ids" {
    description = "The subnet IDs to launch the ECS capacity provider in"
    type        = list(string)
    default     = ["subnet-01b912e902f245409","subnet-0932ec1a59b27b09e"]  # Replace with valid subnet IDs
}

variable "task_definition" {
    description = "The ARN of the ECS task definition"
    type        = string
    default     = ""  # Default value for task definition ARN, can be overridden
  
}
variable "security_group_ids" {
    description = "The security group IDs for the ECS service"
    type        = list(string)
    default     = ["sg-080848dcbcb487199"]  # Replace with valid security group IDs
}
variable "container_name" {
    description = "The name of the container in the ECS task definition"
    type        = string
    default     = "pihire-container"  # Default value for container name
}
variable "container_port" {
    description = "The port on which the container listens"
    type        = number
    default     = 80  # Default value for container port
}
variable "target_group_arn" {
    description = "The ARN of the target group to forward traffic to"
    type        = string
    default     = ""  # Default value for target group ARN, can be overridden
}