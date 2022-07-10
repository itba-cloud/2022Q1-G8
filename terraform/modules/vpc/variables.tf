variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnet_name" {
  type        = string
  description = "Private Subnet Name"
}

variable "private_subnet_cidr_block" {
  type        = string
  description = "Private subnet CIDR"
  default     = "10.0.1.0/24"
}

