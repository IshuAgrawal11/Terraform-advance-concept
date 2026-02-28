variable "aws_region" {
  default = "eu-north-1"
  type = string

}

variable "server_config" {
  type = map(object({
    ami           = string
    instance_type = string
    storage_size  = number
    instance_state = string
  }))
  default = {
    "web-server" = {
      ami           = "ami-056335ec4a8783947" # Amazon Linux
      instance_type = "t3.micro"
      storage_size  = 15
      instance_state = "running"
    }
  }
}

variable "env" {
  default = "dev"
  type = string
}