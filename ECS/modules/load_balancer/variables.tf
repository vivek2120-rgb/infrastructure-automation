variable "security_group_ids" {
  description = "List of security group IDs to associate with the ECS service"
  type        = list(string)
  
}
variable "subnet_ids" {
  description = "List of subnet IDs where the ECS service will be deployed"
  type        = list(string)
  
}
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  
}
variable "port" {
  description = "Port on which the load balancer will listen"
  type        = number
  default     = 443
}
variable "target_group_arn" {
  description = "ARN of the target group to forward traffic to"
  type        = string
}
variable "host_name" {
  description = "Host header value for the listener rule"
  type        = string
  default     = "qapihire.paraminfo.com" # Replace with your actual host name
}
variable "listener_rule_priority" {
  description = "Priority for the listener rule"
  type        = number
  default     = 1 # Default priority value, ensure it is unique for each rule
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for the load balancer listener"
  type        = string
  default     = "arn:aws:acm:ap-south-1:211125439608:certificate/ffc6c240-b3c4-471a-98f7-9ecbfec7060f"
}
