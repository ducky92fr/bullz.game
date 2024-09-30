variable "ami_image" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instances" {
  type = map(object({
    availability_zone           = string
    vpc_security_group          = bool
    subnet_ip                   = bool
    user_data                   = string
    associate_public_ip_address = bool
  }))
}