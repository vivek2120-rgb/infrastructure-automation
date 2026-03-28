provider "aws" {
  region = "ap-south-1"
  
}

module "ecs_ec2_capacity_provider" {
    source = "./modules/capacity_providers_auto_scalling_groups"
    ecs_cluster_name = var.ecs_cluster_name
    subnet_ids = var.subnet_ids
    ami_id = var.ami_id
    instance_type = var.instance_type
    security_group_ids = var.container_security_group_ids
    key_name = var.key_name
    iam_instance_profile_name = var.iam_instance_profile_name

} 
module "ecs_cluster" {
    source = "./modules/ecs_cluster"
    ecs_cluster_name = var.ecs_cluster_name
  
}

resource "aws_ecs_cluster_capacity_providers" "attach_capacity_providers_to_cluster" {
    cluster_name = module.ecs_cluster.name
    # Ensure the capacity provider is created before attaching it to the cluster
    depends_on = [module.ecs_ec2_capacity_provider]
    capacity_providers = [module.ecs_ec2_capacity_provider.ec2_provider_name]
    default_capacity_provider_strategy {
        capacity_provider = module.ecs_ec2_capacity_provider.ec2_provider_name
        weight = 1
    }
  
}

module "ecs_task_definition" {
    for_each = toset([for i in range(length(var.task_family_name)) : tostring(i)])
    source = "./modules/taskdefination"
    task_family_name = var.task_family_name[each.key]
    container_name = var.container_name[each.key]
    container_image = var.container_image[each.key]
    container_port = var.container_port[each.key]
    cpu = var.cpu
    memory = var.memory
    log_group_name = var.log_group_name[each.key]
    aws_region = var.aws_region
    log_stream_prefix = var.log_stream_prefix
}

module "target_group" {
    count = length(var.target_group_names)
    source = "./modules/target_groups"
    target_group_name = var.target_group_names[count.index]
    vpc_id = var.vpc_id
    container_port = var.target_group_ports[count.index]  
    health_check_path = var.health_check_paths[count.index]
}
module "load_balancer" {
    depends_on = [ module.target_group ]
    source = "./modules/load_balancer"
    cluster_name = var.ecs_cluster_name
    security_group_ids = var.alb_security_group_ids
    subnet_ids = var.subnet_ids
    port = var.load_balancer_port
    target_group_arn = module.target_group[0].target_group_arn
}
module "load_balancer_listener_rules" {
    depends_on = [module.load_balancer]
    count = length(var.host_name)
    source = "./modules/load_balancer_listener_rules"
    host_name = var.host_name[count.index]
    listener_arn = module.load_balancer.listener_arn
    target_group_arn = module.target_group[count.index].target_group_arn
    listener_rule_priority = count.index + 1  # Default priority, can be adjusted as needed
}

module "ecs_service" {
    for_each = module.ecs_task_definition
    source = "./modules/service"
    ecs_service_name = var.ecs_service_name[each.key]
    ecs_cluster_name = module.ecs_cluster.name
    subnet_ids = var.subnet_ids
    task_definition = each.value.task_definition_arn
    security_group_ids = var.alb_security_group_ids
    container_name = each.value.container_name
    container_port = each.value.container_port
    target_group_arn = module.target_group[each.key].target_group_arn

}



