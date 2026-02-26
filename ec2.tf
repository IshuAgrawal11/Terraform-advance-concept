resource "aws_key_pair" "mykey" {
    key_name = "terra-key"
    public_key = file("~/.ssh/terra-key.pub")
}

resource "aws_default_vpc" "myvpc" {
    tags = {
        Name = "Default VPC"
    }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.myvpc.id #Interpolation is a way to use variables in terraform files

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
}

resource "aws_instance" "ec2" {
    # count = 2 # if we want to create multiple ec2 instances with same name and specification
    for_each = var.server_config
    ami = each.value.ami
    instance_type = each.value.instance_type
    key_name = aws_key_pair.mykey.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    user_data = file("nginx.sh")

    root_block_device {
        volume_size = each.value.storage_size
        volume_type = "gp3"
        delete_on_termination = true
    }

    tags = {
        Name = each.key
    }
}
