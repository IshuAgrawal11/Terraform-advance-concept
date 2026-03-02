variable "instance_count" {
  type = number
  description = "This is a variable for no. of Instances"
  
}

variable "instance_type" {
  type = string
  description = "This is a variable for instance type"
  
}

variable "ami_id" {
  type = string
  description = "This is a variable for ami id"
  
}

variable "storage_size" {
  type = string
  description = "This is a variable for volume size"
  
}


variable "env" {
  description = "This is a enviroment for my Infra"
  type = string
}