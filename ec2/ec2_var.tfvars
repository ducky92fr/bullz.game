
ami_image = "ami-0e86e20dae9224db8" 
instance_type = "t2.micro"
key_name      = "bullz_key"      ####this is our key for connecting to ec2 instacnes####


#creating 7 instances, two are in the public subnet and the other 4 are in the private one 
#the public ones are for the frontend and the loadbalancer
#the private ones for the microservices: pricing updates, costumer, admin, casino and betting service)
#all of them have nginx installed as a server 
#the rest of the configurations will be done with ansible

instances = {

  frontend_ec2 = {
    availability_zone           = "us-east-1a"    
    vpc_security_group          = true
    subnet_ip                   = true 
    associate_public_ip_address = true
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there!</h1></body></html>" > /var/www/html/index.html
        EOF
  }

  lb_ec2 = {
    availability_zone           = "us-east-1a"    
    vpc_security_group          = true
    subnet_ip                   = true
    associate_public_ip_address = true
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there!</h1></body></html>" > /var/www/html/index.html
        EOF
  }

  service_pricing_ec2 = {
    availability_zone           = "us-east-1b"     
    subnet_ip                   = false
    vpc_security_group          = false
    associate_public_ip_address = false
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF
  }

    service_admin_ec2 = {
    availability_zone           = "us-east-1b"     
    subnet_ip                   = false
    vpc_security_group          = false
    associate_public_ip_address = false
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF
  }

  service_costumer_ec2 = {
    availability_zone           = "us-east-1b"   
    subnet_ip                   = false 
    vpc_security_group          = false
    associate_public_ip_address = false
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF
  }
  service_casino_ec2 = {
    availability_zone           = "us-east-1b"   
    subnet_ip                   = false
    vpc_security_group          = false
    associate_public_ip_address = false
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF
  }

  service_casino_ec2 = {
    availability_zone           = "eu-west-2b"   
    subnet_ip                   = false
    vpc_security_group          = false
    associate_public_ip_address = false
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        sudo systemctl start nginx
        sudo systemctl enable nginx
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF
  }

}
