resource "aws_db_instance" "db" {
  db_name                = var.db-name
  username               = var.db-username
  password               = var.db-password

  allocated_storage      = var.db-allocated-storage
  max_allocated_storage  = var.db-max-storage # this allows for auto-scaling

  engine                 = var.db-engine
  engine_version         = var.db-engine-version
  instance_class         = var.db-instance-class
  parameter_group_name   = var.db-parameter-group-name

  availability_zone      = aws_subnet.private_subnet_az.availability_zone
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sec_group.id]
  publicly_accessible    = false
}

resource "aws_security_group" "db_sec_group" {
  name        = "allow_mySQL"
  description = "Allow MySQL to backend ec2 instances"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_default_subnet.public_subnet.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}