variable "host_name" {
    description = "Host header value for the listener rule"
    type        = string
    default     = "qapihire.paraminfo.com"  # Replace with your actual host names
  
}
variable "listener_rule_priority" {
    description = "Priority for the listener rule"
    type        = number
    default     = 1  # Default priority value, ensure it is unique for each rule
  
}
variable "target_group_arn" {
    description = "ARN of the target group to forward traffic to"
    type        = string
  
}
variable "listener_arn" {
    description = "ARN of the load balancer listener"
    type        = string
    default     = ""  # This should be set to the actual listener ARN when using the module
}