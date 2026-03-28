# This resource block will create an ECS task definition
resource "aws_ecs_task_definition" "ecs_task_definition" {
    family                   = var.task_family_name
    network_mode             = "bridge"
    requires_compatibilities = ["EC2"]
    cpu                      = var.cpu
    memory                   = var.memory
    execution_role_arn      = "arn:aws:iam::211125439608:role/ecsTaskExecutionRole"
    task_role_arn           = "arn:aws:iam::211125439608:role/ecsTaskExecutionRole"

    container_definitions = jsonencode([
        {
        name      = var.container_name
        image     = var.container_image
        essential = true
        portMappings = [
            {
            containerPort = var.container_port
            hostPort      = 0
            protocol      = "tcp"
            }
        ]
        logConfiguration = {
            logDriver = "awslogs"
            options = {
                "awslogs-group"         = var.log_group_name
                "awslogs-region"        = var.aws_region
                "awslogs-stream-prefix" = var.log_stream_prefix
            }
        }
        }
    ])
    
    tags = {
        Name = var.task_family_name
    }

  
}