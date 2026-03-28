variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string  
  default     = "pihire"
}
variable "subnet_ids" {
    description = "The subnet IDs to launch the ECS capacity provider in"
    type        = list(string)
    default     = ["subnet-01b912e902f245409","subnet-0932ec1a59b27b09e"]
}
variable "ami_id" {
    description = "The AMI ID to use for the ECS capacity provider instances"
    type        = string
    default     = "ami-018bf378c35021448"  # Replace with a valid AMI ID
}
variable "instance_type" {
    description = "The instance type for the ECS capacity provider instances"
    type        = string
    default     = "t3.medium"  # Replace with a suitable instance type
}
variable "alb_security_group_ids" {
    description = "The security group IDs for the application load balancer"
    type        = list(string)
    default     = ["sg-0ce32c0b76626f811"]  # Replace with valid security group IDs
}
variable "container_security_group_ids" {
    description = "The security group IDs for the ECS capacity provider instances"
    type        = list(string)
    default     = ["sg-046c894b15859d0fe"]  # Replace with valid security group IDs
}
variable "key_name" {
    description = "The key pair name for SSH access to the ECS instances"
    type        = string
    default     = "pivms"  # Replace with a valid key pair name
}
variable "iam_instance_profile_name" {
    description = "The IAM instance profile name for the ECS instances"
    type        = string
    default     = "ecsInstanceRole"  # Replace with a valid IAM instance profile name
}
variable "task_family_name" {
    description = "The family name for the ECS task definition"
    type        = list(string)
    default     = ["pihire-UI-task-definition","pihire-API-task-definition","pihire-Carrer-UI-task-definition"]  # Default value for task family name
}
variable "cpu" {
    description = "The amount of CPU to allocate for the ECS task"
    type        = string
    default     = "256"  # Default value for CPU
}
variable "memory" {
    description = "The amount of memory to allocate for the ECS task"
    type        = string
    default     = "512"  # Default value for memory
}
variable "container_name" {
    description = "The name of the container in the ECS task definition"
    type        = list(string)
    default     = ["pihire-UI-container", "pihire-API-container", "pihire-career-UI-container"]  # Default values for container names
}
variable "container_image" {
    description = "The Docker image to use for the container"
    type        = list(string)
    default     = ["211125439608.dkr.ecr.ap-south-1.amazonaws.com/pihire-ui:latest",
                   "211125439608.dkr.ecr.ap-south-1.amazonaws.com/pihire-api:latest",
                   "211125439608.dkr.ecr.ap-south-1.amazonaws.com/pihire-career-ui:latest"]
}
variable "container_port" {
    description = "The port on which the container listens"
    type        = list(number)
    default     = [80,5000,80]  # Default value for container port
}
variable "ecs_service_name" {
    description = "The name of the ECS service"
    type        = list(string)
    default     = ["pihire-UI","pihire-API","pihire-career-UI"]  # Default value for ECS service name
}
variable "target_group_names" {
    description = "Name of the target group"
    type        = list(string)  
    default     = ["pihire-website-target-group","pihire-api-target-group","pihire-carrer-target-group"]
}
variable "target_group_ports" {
    description = "Port on which the target group will listen"
    type        = list(number)
    default     = [80,5000,80]  
}
variable "vpc_id" {
    description = "VPC ID where the target group will be created"
    type        = string  
    default     = "vpc-075a97b2731ec0684"  
}
variable "host_name" {
  description = "Host header value for the listener rule"
  type        = list(string)
  default     = ["qapihireapp1o.paraminfo.online","qapihireapi1o.paraminfo.online","qapihirecp1o.paraminfo.online"]  # Replace with your actual host name
}
variable "load_balancer_port" {
    description = "Port on which the load balancer will listen"
    type        = number
    default     = 443
}
variable "log_group_name" {
    description = "The name of the CloudWatch log group for logging"
    type        = list(string)
    default     = ["pihire-UI-log-group", "pihire-API-log-group", "pihire-Career-UI-log-group"]  # Default values for log group names
}
variable "aws_region" {
    description = "The AWS region where the ECS task is deployed"
    type        = string
    default     = "ap-south-1"  
}
variable "log_stream_prefix" {
    description = "The prefix for the CloudWatch log stream"
    type        = string
    default     = "pihire-ecs-log-stream" 
}
variable "health_check_paths" {
    description = "Health check paths for the target groups"
    type        = list(string)
    default     = ["/healthz", "/healthz", "/healthz.html"]  
}
