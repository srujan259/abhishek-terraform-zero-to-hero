variable "region" {
  type    = string
  default = "us-east-1"
}
variable "ami_id" {
    type = string
    #default = "ami-0fc5d935ebf8bc3bc"
}
variable "instance_type" {
    type = string
    #default = "t2.micro"  
}
resource "aws_security_group" "allow_ssh" {
    name_prefix = "allow-ssh-"
    description = "allow ssh inbound traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
resource "aws_instance" "example" {
    ami           = var.ami_id  # Specify an appropriate AMI ID 
    instance_type = var.instance_type
    subnet_id     = "subnet-e44fdbc5"
    key_name      = "terraform-abhishek"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
    Name = "terraform-ec2"
  }  

}

output "public_ip" {
    value = "aws_instance.example.public_ip"
}

