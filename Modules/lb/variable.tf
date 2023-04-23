

variable "lb_type"{
    description="Load Balancer Type"
    type=string
    default="application"
}

variable "intern_lb_sg"{
    description="Load Balancer SG"
    type=any
    default=""
}

variable "intern_lb_sub"{
    description="Load Balancer Subnet"
    type=list(string)
    default=[""]
}

# variable "intern_lb_tg_name"{
#     type=string
#     default="PrivateTargetGroup"
# }

variable "intern_lb_port"{
    type=number
    default=80
}

variable "intern_prot"{
    description="Internal LB Protocol"
    type=string
    default="HTTP"
}

variable "vpc_id"{
    type=string
    default=""
}

# variable "intern_tg_arn"{
#     type=string
#     default="aws_lb_target_group.private_tg.arn"
# }

variable "intern_tg_id"{
    type=string
    default=""
}

variable "extern_lb_sg"{
    description="Load Balancer SG"
    type=any
    default=""
}

variable "extern_lb_sub"{
    description="Load Balancer Subnet"
    type=list(string)
    default=[""]
}

variable "extern_lb_tg_name"{
    type=string
    default="PublicTargetGroup"
}

# variable "extern_tg_arn"{
#     type=string
#     default="aws_lb_target_group.public_tg.arn"
# }

variable "extern_tg_id"{
    type=string
    default=""
}

