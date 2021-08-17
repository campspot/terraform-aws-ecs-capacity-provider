/**
 * # ![AWS](aws-logo.png) ECS Capacity Provider
 *
 * Purpose: Blueprints for AWS ECS Capacity Providers.
 */
resource "aws_ecs_capacity_provider" "capacity_provider" {
  name = var.name
  tags = var.tags
  tags_all = var.tags
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.capacity_provider.arn
    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 100
      maximum_scaling_step_size = 1
    }
  }
}

resource "aws_autoscaling_group" "capacity_provider" {
  name_prefix         = "${var.name}-"
  vpc_zone_identifier = var.subnet_ids
  max_size            = var.asg_max_size
  min_size            = 0
  desired_capacity    = 0

  capacity_rebalance = true

  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
    }

    launch_template {
      launch_template_specification {
        launch_template_id = var.launch_template
        version            = "$Latest"
      }
    }
  }
}
