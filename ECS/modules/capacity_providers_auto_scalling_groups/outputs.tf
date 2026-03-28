output "ec2_provider_name" {
    description = "The name of the ECS EC2 capacity provider"
    value       = aws_ecs_capacity_provider.ec2_provider.name
  
}