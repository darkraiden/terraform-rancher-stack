############
# Provider #
############

variable "aws_region" {}

##################
# Security Group #
##################

variable "vpc_id" {}

variable "sg_name" {}

################
# Subnet Group #
################

variable "subnet_group_name" {}

variable "subnet_ids" {}

################
# RDS Instance #
################

variable "identifier" {}

variable "engine" {}

variable "engine_version" {}

variable "instance_class" {}

variable "storage_type" {}

variable "allocated_storage" {}

variable "db_name" {}

variable "db_username" {}

variable "db_password" {}

variable "db_port" {
    default = 3306
}

variable "parameter_group_name" {}

variable "is_multi_az" {}

variable "publicly_accesible" {}

variable "monitoring_interval" {}

variable "allow_major_version_upgrade" {}

variable "auto_minor_version_upgrade" {}

variable "apply_immediately" {}

variable "maintenance_window" {}

variable "backup_retention_period" {}

variable "backup_window" {}
