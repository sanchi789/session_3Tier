module "vpc" {
    source  = "./Modules/vpc"
    vpc_cidr=var.vpc_cidr
    # sub_vpc_id=var.sub_vpc_id
    az_1=var.az_1
    az_2=var.az_2
    pub_sub_cidr_1=var.pub_sub_cidr_1
    pri_sub_cidr_1=var.pri_sub_cidr_1
    pub_sub_cidr_2=var.pub_sub_cidr_2
    pri_sub_cidr_2=var.pri_sub_cidr_2
    pri_sub_cidr_3=var.pri_sub_cidr_3
    pri_sub_cidr_4=var.pri_sub_cidr_4
    route_table_cidr=var.route_table_cidr
  
    extern_sg_name=var.extern_sg_name
    extern_sg_des=var.extern_sg_des
    ing_from_to_port=var.ing_from_to_port
    egr_from_to_port=var.egr_from_to_port
    ingress_sg_protocol=var.ingress_sg_protocol
    egress_sg_protocol=var.egress_sg_protocol
    extern_cidr_sg=var.extern_cidr_sg
    self_ip=var.self_ip
    ipv6_cidr=var.ipv6_cidr
    intern_sg_name=var.intern_sg_name
    internal_description=var.internal_description
    internal_description_ingress=var.internal_description_ingress
    internal_cidr_blk=var.internal_cidr_blk
    intern_ingress_sg=var.intern_ingress_sg
    public_sg_name=var.public_sg_name
    public_sg_desc=var.public_sg_desc
    pub_ingr_sg=var.pub_ingr_sg
    private_sg_name=var.private_sg_name
    priv_description=var.priv_description
    priv_description_ingr=var.priv_description_ingr
    priv_ingr_sg=var.priv_ingr_sg
    dbms_sg_name=var.dbms_sg_name
    dbms_des=var.dbms_des
    dbms_des_ingr=var.dbms_des_ingr
    dbms_port=var.dbms_port
    dbms_ingr_sg=var.dbms_ingr_sg
    bast_sg_name=var.bast_sg_name
    bast_des=var.bast_des
    bast_des_ingr=var.bast_des_ingr
    bash_ssh_port=var.bash_ssh_port
}






module "ec2" {
    source  = "./Modules/ec2"
    
    inst_type=var.inst_type
    key_name=var.key_name
    monit_inst=var.monit_inst
    vpc_sg_pri=[module.vpc.Private_EC2_id]
    vpc_sg_pub=[module.vpc.Public_EC2_id]
    # iam_inst=var.iam_inst
    pri_sub=module.vpc.pri_sub_1_id
    pub_sub=module.vpc.pub_sub_1_id
    # public_ip=var.public_ip
}

module "lb" {
    source  = "./Modules/lb"
    # internal_name=var.internal_name
    # inter=var.inter
    lb_type=var.lb_type
    intern_lb_sg=module.vpc.internal_lb_sg_id
    intern_lb_sub=module.vpc.intern_lb_sub_id
    #intern_lb_tg_name=var.intern_lb_tg_name
    intern_lb_port=var.intern_lb_port
    intern_prot=var.intern_prot
    vpc_id=module.vpc.awsvpc_id
    #intern_tg_arn=var.intern_tg_arn
    intern_tg_id=module.ec2.pri_ec2_id
    
    extern_lb_sg=module.vpc.exernal_lb_sg_id
    extern_lb_sub = module.vpc.exernal_lb_sub_id
    extern_lb_tg_name=var.extern_lb_tg_name
  
    extern_tg_id=module.ec2.pub_ec2_id
    
}





