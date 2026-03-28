# This file is part of a Terraform module that creates an ECS capacity provider with an auto-scaling group.
resource "aws_ecs_capacity_provider" "ec2_provider" {
    name = "${var.ecs_cluster_name}-ec2-capacity-provider"
    auto_scaling_group_provider {
        auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn
        managed_termination_protection = "ENABLED"
        managed_scaling {
            status = "ENABLED"
            target_capacity = 90
            minimum_scaling_step_size = 1
            maximum_scaling_step_size = 1
        }
    }
  
}
# This resource will create auto-scaling groups for ECS capacity providers.
resource "aws_autoscaling_group" "ecs_asg" {
    name = "${var.ecs_cluster_name}-asg"
    min_size = 1
    max_size = 1
    desired_capacity = 1
    vpc_zone_identifier = var.subnet_ids
    launch_template {
        id = aws_launch_template.ecs_launch_template.id
        version = "$Latest"
    }
    protect_from_scale_in = true
    tag {
        key                 = "Name"
        value               = "${var.ecs_cluster_name}-asg"
        propagate_at_launch = true
    }


    

}


# This resource will create a launch template for the auto-scaling group.
resource "aws_launch_template" "ecs_launch_template" {
    name_prefix   = "${var.ecs_cluster_name}-launch-template"
    image_id      = var.ami_id
    instance_type = var.instance_type
    key_name      = var.key_name
    iam_instance_profile {
        name = var.iam_instance_profile_name
    }
  # Important: ECS expects user data to be base64-encoded
    user_data = base64encode(<<EOF
                #!/bin/bash 
                echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
                EOF 
                )
    network_interfaces {
        associate_public_ip_address = true
        security_groups = var.security_group_ids
    }
}

