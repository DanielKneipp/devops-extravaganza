variable "prefix" {
  type        = string
  description = "Prefix to add to resource names"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id"
}

variable "ami" {
  type        = string
  description = "AMI id"
}
