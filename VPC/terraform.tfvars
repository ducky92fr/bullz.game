region = "us-east-1"

availability_zone = {
  private_subnet_az = "us-east-1b"
  public_subnet_az  = "us-east-1a"
}

cidr_block = "10.0.0.0/16"

vpc_name = "bullz_vpc"

public_subnet_cidr_block = "10.1.0.0/24"

private_subnet_cidr_block = "10.2.0.0/24"

ami_image = "ami-0e86e20dae9224db8" #added

instance_type = "t2.micro"

