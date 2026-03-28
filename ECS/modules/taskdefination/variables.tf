variable "task_family_name" {
    description = "The family name for the ECS task definition"
    type        = string
}
variable "cpu" {
    description = "The amount of CPU to allocate for the ECS task"
    type        = string
}
variable "memory" {
    description = "The amount of memory to allocate for the ECS task"
    type        = string
}
variable "container_name" {
    description = "The name of the container in the ECS task definition"
    type        = string
}
variable "container_image" {
    description = "The Docker image to use for the container"
    type        = string
}
variable "container_port" {
    description = "The port on which the container listens"
    type        = number
}
variable "log_group_name" {
    description = "The name of the CloudWatch log group for logging"
    type        = string
  
}
variable "aws_region" {
    description = "The AWS region where the ECS task is deployed"
    type        = string
}
variable "log_stream_prefix" {
    description = "The prefix for the CloudWatch log stream"
    type        = string
}