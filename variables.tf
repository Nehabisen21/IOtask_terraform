variable "region" {}

#########################
# VPC1 Variables
#########################
variable "vpc1_cidr" {}
variable "vpc1_public_cidr" {}
variable "vpc1_private_cidr" {}

#########################
# VPC2 Variables (RDS)
#########################
variable "vpc2_cidr" {}

# RDS requires 2 subnets in 2 AZs
variable "vpc2_private_subnet_1_cidr" {}
variable "vpc2_private_subnet_2_cidr" {}

#########################
# AZ Selection
#########################
variable "az1" {}
variable "az2" {}

#########################
# EC2 + SSH
#########################
variable "allowed_ssh_cidr" {}
variable "instance_type" {}
variable "key_name" {}

#########################
# RDS Variables
#########################

variable "db_allocated_storage" {}
variable "db_instance_class" {}
variable "storage_type" {}


