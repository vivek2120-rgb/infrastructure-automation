#This resource creates a target group for the ECS service
resource "aws_lb_target_group" "ecs_target_group" {
  name     = "${var.target_group_name}-TG"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"

  health_check {
    path                = var.health_check_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.target_group_name}-target-group"
  }
} 

