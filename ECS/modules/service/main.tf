resource "aws_ecs_service" ecs_service {
    name            = var.ecs_service_name
    cluster         = var.ecs_cluster_name
    task_definition = var.task_definition
    desired_count   = 1
    launch_type     = "EC2"    
    load_balancer {
        target_group_arn = var.target_group_arn
        container_name   = var.container_name
        container_port   = var.container_port
    }
    ordered_placement_strategy {
        type  = "binpack"
        field = "cpu"
    }

    tags = {
        Name = var.ecs_service_name
    }
}
