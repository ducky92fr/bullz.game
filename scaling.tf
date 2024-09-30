provider "aws" {
  region = "us-east-1"
}

resource "aws_launch_template" "example" {
  name          = "example"
  image_id      = "ami-0e86e20dae9224db8"  # Changed
  instance_type = "t2.micro"

  key_name = "var.key_name"

  network_interfaces {
    security_groups = ["$aws_security_groups.security_group.id"] 
  }
}

resource "aws_autoscaling_group" "example" {
  desired_capacity     = 2
  max_size             = 10
  min_size             = 1
  health_check_type    = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier  = ["aws_subnet.private_subnet.id", "aws_subnet.private_subnet.id"] 
  
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "example-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.example.name
}


