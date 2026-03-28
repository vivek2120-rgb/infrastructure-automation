variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
 # default     = "default-ecs-cluster"  
}
variable "subnet_ids" {
    description = "The subnet ID to launch the ECS capacity provider in"
    type        = list(string)
  #  default     = []
  
}
variable "ami_id" {
    description = "The AMI ID to use for the ECS capacity provider instances"
    type        = string
   # default     = "ami-12345678"  # Replace with a valid AMI ID
  
}
variable "instance_type" {
    description = "The instance type for the ECS capacity provider instances"
    type        = string
   # default     = "t3.micro"  # Replace with a suitable instance type
  
}
variable "security_group_ids" {
    description = "The security group ID for the ECS capacity provider instances"
    type        = list(string)
   # default     = "sg-12345678"  # Replace with a valid security group ID
  
}
variable "key_name" {
    description = "The key pair name for SSH access to the ECS instances"
    type        = string
  #  default     = "default-key-pair"  # Replace with a valid key pair name
  
}
variable "iam_instance_profile_name" {
    description = "The IAM instance profile name for the ECS instances"
    type        = string
  #  default     = "ecsInstanceRole"  # Replace with a valid IAM instance profile name
  
}