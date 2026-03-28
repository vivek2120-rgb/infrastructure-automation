output "name" {
  description = "The name of the ECS EC2 capacity provider"
  value       = aws_ecs_cluster.ecs_cluster.name
}