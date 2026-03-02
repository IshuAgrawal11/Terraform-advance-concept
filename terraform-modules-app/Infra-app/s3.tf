resource "aws_s3_bucket" "my_bucket" {
    bucket = "${var.env}-ishuagrawal-module-app-bucket"
    
    tags = {
        Name = "My bucket"
        Enviroment = var.env
    }

}