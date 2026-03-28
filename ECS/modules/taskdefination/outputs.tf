output "task_definition_arn" {
  description = "Outputs for ECS Task Definition"
  value = aws_ecs_task_definition.ecs_task_definition.arn
  
}
output "container_name" {
  description = "Name of the container in the ECS task definition"
  value       = jsondecode(aws_ecs_task_definition.ecs_task_definition.container_definitions)[0].name
  
}
output "container_port" {
  description = "Port on which the container listens"
  value       = jsondecode(aws_ecs_task_definition.ecs_task_definition.container_definitions)[0].portMappings[0].containerPort
  
}