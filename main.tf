provider "aws" {
  region = "ap-south-1"
}

module "ec2_cluster" {
  source                 = "./modules/ec2"
  name                   = "my-cluster"
  instance_count         = 1
  ami                    = "ami-05695932c5299858a"
  instance_type          = "t2.micro"
  key_name               = "key-001"
  monitoring             = true
  vpc_security_group_ids = ["sg-00c653a0023c6da3e"]
  subnet_id              = "subnet-9d9f2fd1"
  ebs_block_device = [{
    device_name = "sda2"
    volume_size   = 20
  }] 

  tags = {
    Owner   = "Toyota"
    Environment = "dev"
  }
}