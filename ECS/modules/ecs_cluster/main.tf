
resource "aws_ecs_cluster" "ecs_cluster" {
    name = var.ecs_cluster_name
    setting {
        name  = "containerInsights"
        value = "enabled"
    }
    tags = {
        Name = var.ecs_cluster_name
    }
    
}
