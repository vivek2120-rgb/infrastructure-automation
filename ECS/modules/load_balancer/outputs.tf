output "load_balancer_arn" {
    description = "The ARN of the ECS load balancer"
    value       = aws_lb.ecs_load_balancer.arn  
}
output "listener_arn" {
    description = "The ARN of the ECS load balancer listener"
    value       = aws_lb_listener.ecs_listener.arn  
  
}
output "load_balancer_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.ecs_load_balancer.dns_name
}