

variable "inst_type"{
    type=string
    default="t2.micro"
}

variable "key_name"{
    description="Instanse Key Name"
    type=string
    default="pre1"
}

variable "monit_inst"{
    description="Monitoring of Instance"
    type=bool
    default=true
}

variable "vpc_sg_pri"{
    description="VPC SG for private"
    type= set(string)
    default= [""]
}

variable "vpc_sg_pub"{
    description="VPC SG for public"
    type=any
    default= [""]
}

# variable "iam_inst"{
#     description="IAM Role for Insstances"
#     type=string
#     default="aws_iam_instance_profile.private_profile.name"
# }

variable "pri_sub"{
    description="Private Subnet for EC2"
    type=string
    default=""
}

variable "pub_sub"{
    description="Public Subnet for EC2"
    type=string
    default=""
}

