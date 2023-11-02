provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = "ami-0fc5d935ebf8bc3bc"
    subnet_id = "subnet-e44fdbc5"
    instance_type_value = "t2.micro"


}