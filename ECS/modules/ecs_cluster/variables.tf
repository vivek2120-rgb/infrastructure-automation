variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "default-ecs-cluster"
  
}
variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {
    Project = "pihire"
  }
}



