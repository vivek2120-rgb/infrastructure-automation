#This resource will create a load balancer for the ECS service
resource "aws_lb" "ecs_load_balancer" {
    name               = "${var.cluster_name}-load-balancer"
    internal           = false
    load_balancer_type = "application"
    security_groups    = var.security_group_ids
    subnets            = var.subnet_ids
    
    enable_deletion_protection = false
    
    tags = {
        Name = "${var.cluster_name}-load-balancer"
    }
    }

# This resource will create a listener for the load balancer based on the Host header
resource "aws_lb_listener" "ecs_listener" {
    load_balancer_arn = aws_lb.ecs_load_balancer.arn
    port              = var.port
    protocol          = "HTTPS"
    certificate_arn   = var.certificate_arn

    default_action {
        type = "forward"
        target_group_arn = var.target_group_arn
    }
}

    
