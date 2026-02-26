# variable "aws_instance_type" {
#     default = "t3.micro"
#     type = string
# }

variable "aws_region" {
    default = "eu-north-1"

}

# variable "ami_id" {
#     default = "ami-073130f74f5ffb161"
#     type = string
  
# }

# variable "root_volume_size" {
#     default = 20
#     type = number
# }

variable "server_config" {
  type = map(object({
    ami           = string
    instance_type = string
    storage_size  = number
  }))
  default = {
    "web-server" = {
      ami           = "ami-056335ec4a8783947" # Amazon Linux
      instance_type = "t3.micro"
      storage_size  = 15
    },
    "db-server" = {
      ami           = "ami-073130f74f5ffb161" # Ubuntu
      instance_type = "t3.small"
      storage_size  = 20
    }
  }
}