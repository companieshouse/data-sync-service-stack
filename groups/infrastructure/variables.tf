# Environment
variable "environment" {
  type        = string
  description = "The environment name, defined in envrionments vars."
}
variable "aws_region" {
  default     = "eu-west-2"
  type        = string
  description = "The AWS region for deployment."
}
variable "aws_profile" {
  default     = "development-eu-west-2"
  type        = string
  description = "The AWS profile to use for deployment."
}

# EC2
variable "ec2_key_pair_name" {
  type        = string
  description = "The key pair for SSH access to ec2 instances in the clusters."
}
variable "ec2_instance_type" {
  default     = "t3.medium"
  type        = string
  description = "The instance type for ec2 instances in the clusters."
}
variable "ec2_image_id" {
  default     = "ami-04018f95156d810bc" # ECS optimized Amazon2 Linux in London created 15/03/2023
  type        = string
  description = "The machine image name for the ECS cluster launch configuration."
}

# Auto-scaling Group
variable "asg_max_instance_count" {
  default     = 0
  type        = number
  description = "The maximum allowed number of instances in the autoscaling group for the cluster."
}
variable "asg_min_instance_count" {
  default     = 0
  type        = number
  description = "The minimum allowed number of instances in the autoscaling group for the cluster."
}
variable "asg_desired_instance_count" {
  default     = 0
  type        = number
  description = "The desired number of instances in the autoscaling group for the cluster. Must fall within the min/max instance count range."
}

variable "asg_scaledown_schedule" {
  default     = ""
  type        = string
  description = "The schedule to use when scaling down the number of EC2 instances to zero."
}

variable "asg_scaleup_schedule" {
  default     = ""
  type        = string
  description = "The schedule to use when scaling up the number of EC2 instances to their normal desired level."
}

variable "enable_asg_autoscaling" {
  default     = true
  type        = bool
  description = "Whether to enable auto-scaling of the ASG by creating a capacity provider for the ECS cluster."
}

# Container Insights - ECS
variable "enable_container_insights" {
  type        = bool
  description = "A boolean value indicating whether to enable Container Insights or not"
  default     = true
}

# Scheduler variables
variable "create_eventbridge_scheduler_group" {
  default     = true
  description = "Whether to create the ECS EventBridge scheduler group"
  type        = bool
}

variable "create_eventbridge_scheduler_role" {
  default     = true
  description = "Whether to enable eventbridge scheduler iam role in ecs cluster."
  type        = bool
}
