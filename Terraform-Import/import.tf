# terraform import aws_instance.my_instance <id>
resource "aws_instance" "my_instance" {
    ami = "unknown"
    instance_type = "unknowm"
    key_name = "unknown"
}

/* 
When you run terraform import, Terraform updates your State File with the real-world configuration 
of the instance, but it does not touch your .tf code. You have to manually copy the actual values 
from the state back into your file to align them. What happens if you don't update the code?
The next time you run terraform plan, Terraform will see that your code says "unknown" but the real 
AWS instance is "t3.micro". It will then try to change the real instance to "unknown", which will 
likely fail or cause an unwanted replacement (destroy and recreate).
*/
