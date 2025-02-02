variable "name" {
  description = "Name of the capacity provider"
}

variable "launch_template" {
  description = "Identifier of Launch Template used for auto-scaling"
}

variable "subnet_ids" {
  type        = set(string)
  description = "Indicate which subnet_ids to deploy to"
  default     = []
}
variable "tags" {
  type        = map(any)
  description = "A map of tags to attach to all capacity provider resources"
  default     = {}
}

variable "asg_max_size" {
  description = "Maximum allowed nodes in the cluster"
  type        = number
  default     = 3
}

variable "on_demand_base_capacity" {
  description = "Minimum number of on-demand instances used to fulfill desired capacity"
  default     = 0
}

variable "on_demand_percentage_above_base_capacity" {
  description = "Percentage of on-demand vs spot instances"
  default     = 0
}
