
#3.Provisioning 4x r5a.2xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent (updated)
resource "aws_instance" "Machine-ra5-2xlarge-01" {
  count = 1   
  ami = var.ami
  instance_type = var.instance_type["r5a_2xlarge"]
  #subnet_id     = var.subnet_id
  subnet_id = "${element(var.subnet_ids_app, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "RHEL-JBOSS-MySQL-ROUTER"
    Environment = "Test"
    Backup = "Yes"
   }
}

#2.Provisioning 3x r5a.2xlarge RHEL Linux machine with 700GB EBS (OS: 200GB, Data: 500GB) DB_subent
resource "aws_instance" "Machine-ra5-2xlarge-02" {
  count = 1  
  
  ami = var.ami
  instance_type = var.instance_type["r5a_2xlarge"]
  subnet_id = "${element(var.subnet_ids_db, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "200"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "500"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = false
  }

  tags = {
    #Name = "nets_oa_vpc_1-EC2-RDBMS"
    Name = "RDBMS-Core-RTGS-SSS"
    Environment = "Test"
    Backup = "Yes"
   }
}

#7.Provisioning 6x t3a.large RHEL Linux machine with 104GB EBS (OS: 100GB) web_subenet
resource "aws_instance" "Machine-t3a-large" {
  count = 1 
  
  ami = var.ami
  instance_type = var.instance_type["t3a_large"]
  subnet_id = "${element(var.subnet_ids_web, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "RHEL-NGINX"
    Environment = "Test"
    Backup = "Yes"
   }
}
