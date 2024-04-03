# This variable is used to diffentiate between different environments.
# It is often used as prefix for your infrastructure components.
variable "env" {
  description = "Environment name"
  type = string
}

# The default value of the cidr_block here can be overrided when necessary
variable "vpc_cidr_block" {
  description = "CIDR (Classless Inter-Domain Routing)"
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets"
  type = list(string)
}

# variable for the cidr ranges for private subnets
variable "private_subnets" {
  description = "CIDR ranges for private subnets"
  type = list(string)
}

# variable for the cidr ranges for public subnets
variable "public_subnets" {
  description = "CIDR ranges for public subnets"
  type = list(string)
}

variable "private_subnet_tags" {
  description = "Private subnet tags"
  type = map(any)
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type = map(any)
}