############
# Provider #
############

variable "aws_region" {}

##################
# Security Group #
##################

variable "vpc_id" {}

variable "sg_name" {}

########################
# Launch Configuration #
########################

variable "name_prefix" {}

variable "image_id" {}

variable "instance_type" {}

variable "root_volume_type" {
    default = "gp2"
}

variable "root_volume_size" {}

variable "root_delete_on_termination" {
    default = true
}

#####################
# Autoscaling Group #
#####################

variable "asg_name" {}

variable "subnet_ids" {
    type = "list"
}

variable "max_size" {}

variable "min_size" {}

variable "desired_capacity" {}

variable "load_balancers" {
    default = []
    type = "list"
}

variable "health_check_grace_period" {}

variable "health_check_type" {
    default = "EC2"
}

variable "default_cooldown" {
    default = 60
}

variable "force_delete" {
    default = true
}
