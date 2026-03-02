locals {
    region = "eu-north-1"
    name = "eks-cluster"
    vpc_cidr = "172.31.0.0/16"
    public_subnets = ["172.31.1.0/24"]
    private_subnets = ["172.31.101.0/24"]
    intra_subnets = ["172.31.201.0/24"]
    azs = ["eu-north-1a"]
    env = "dev"
}