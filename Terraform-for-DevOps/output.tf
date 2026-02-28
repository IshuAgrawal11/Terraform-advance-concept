output "ec2_public_ip" {
    value = {
        for key, value in aws_instance.ec2 :
        key => value.public_ip
    } 
}

output "ec2_private_ip" {
    value = {
        for key, value in aws_instance.ec2 :
        key => value.private_ip
    }  
}

output "ec2_public_dns" {
    value = {
        for key, value in aws_instance.ec2 :
        key => value.public_dns
    }  
}

output "ec2_private_dns" {
    value = {
        for key, value in aws_instance.ec2 :
        key => value.private_dns
    }  
}