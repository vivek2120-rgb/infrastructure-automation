resource "aws_lb_listener_rule" "ecs_host_rule" {
    count = length(var.host_name)
    listener_arn = var.listener_arn
    priority     = var.listener_rule_priority  # Ensure unique priority for each rule

    action {
        type = "forward"
        target_group_arn = var.target_group_arn
    }

    condition {
        host_header {
            values = [var.host_name]  # Use the host_name variable
        }
    }

  
}