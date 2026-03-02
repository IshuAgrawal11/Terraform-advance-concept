module "dev-Infra-app" {
    source = "./Infra-app"
    ami_id = "ami-073130f74f5ffb161"
    instance_type = "t3.micro"
    instance_count = 1
    storage_size = 10
    env = "dev"
  
}

module "prod-Infra-app" {
    source = "./Infra-app"
    ami_id = "ami-073130f74f5ffb161"
    instance_type = "t3.micro"
    instance_count = 1
    storage_size = 10
    env = "prod"
  
}

module "stg-Infra-app" {
    source = "./Infra-app"
    ami_id = "ami-073130f74f5ffb161"
    instance_type = "t3.micro"
    instance_count = 1
    storage_size = 10
    env = "stg"
  
}

