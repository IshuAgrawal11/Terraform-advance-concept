resource "aws_key_pair" "mykey" {
    key_name = "${var.env}-infra-app-key"
    public_key = file("~/.ssh/terra-key.pub")

    tags = {
        Name = "${var.env}-infra-app-key"
        Enviroment = var.env
    }
}

resource "aws_default_vpc" "myvpc" {
    tags = {
        Name = "Default VPC"
    }
}

resource "aws_security_group" "allow_tls" {
  name        = "${var.env}-Infra-app-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.myvpc.id 
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "all traffic outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-Infra-app-security-group"
    Enviroment = var.env
  }
}

resource "aws_instance" "ec2" {
    count = var.instance_count
    ami = var.ami_id
    instance_type = var.instance_type

    depends_on = [ aws_security_group.allow_tls, aws_key_pair.mykey]
    key_name = aws_key_pair.mykey.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    root_block_device {
        volume_size = var.env == "dev" ? var.storage_size : var.storage_size * 2
        volume_type = "gp3"
        delete_on_termination = true
    }

    tags = {
        Name = "${var.env}-Infra-app-ec2"
        Enviroment = var.env
    }
}

