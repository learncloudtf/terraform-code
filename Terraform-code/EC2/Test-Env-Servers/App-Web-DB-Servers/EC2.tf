
#3.Provisioning 4x r5a.2xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent (updated)
resource "aws_instance" "Machine-ra5-2xlarge-01" {
  count = 4   
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-backoffice-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#2.Provisioning 3x r5a.2xlarge RHEL Linux machine with 700GB EBS (OS: 200GB, Data: 500GB) DB_subent
resource "aws_instance" "Machine-ra5-2xlarge-02" {
  count = 3   
  
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
    Name = "${format("nets_oa_vpc_1-Test-RDBMS-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}



#4.Provisioning 2x r5a.large RHEL Linux machine with 100GB EBS (OS: 100GB) app_subnet
resource "aws_instance" "Machine-r5a-large" {
  count = 4   
  
  ami = var.ami
  instance_type = var.instance_type["r5a_large"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-sss-report-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#5.Provisioning 8x t3a.2xlarge RHEL Linux machine with 104GB EBS (OS: 100GB) app_subnet
resource "aws_instance" "Machine-t3a-2xlarge" {
  count = 4  
  
  ami = var.ami
  instance_type = var.instance_type["t3a_2xlarge"]
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
   #Name = "nets_oa_vpc_1-app-EC2-Sanction-Screening"
    Name = "${format("nets_oa_vpc_1-app-Test-Sanction-Screening-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#16.Provisioning 6x c5.xlarge RHEL Linux machine with 104GB EBS (OS: 100GB) app_sunet (updated)[intance to c5.xlarge]
resource "aws_instance" "Machine-t3a-xlarge" {
  count = 4   
  
  ami = var.ami
  instance_type = var.instance_type["c5_xlarge"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-qpr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#7.Provisioning 6x t3a.large RHEL Linux machine with 104GB EBS (OS: 100GB) web_subenet
resource "aws_instance" "Machine-t3a-large" {
  count = 4  
  
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
    Name = "${format("nets_oa_vpc_1-Test-sss-web-portal-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#8.Provisioning 14x t3a.medium RHEL Linux machine with 104GB EBS (OS: 100GB) web_subnet[updated to t3a large]
resource "aws_instance" "Machine-t3a-medium-01" {
  count = 4
  
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
    Name = "${format("nets_oa_vpc_1-Test-rtgs-web-portal-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#9.Provisioning 2x t3a.medium RHEL Linux machine with 900GB EBS (OS: 100GB, Data: 800GB) app_seubnet
resource "aws_instance" "Machine-t3a-medium-02" {
  count = 4   
  
  ami = var.ami
  instance_type = var.instance_type["t3a_large"]
  subnet_id = "${element(var.subnet_ids_app, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  /*
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "800"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = false
  }
  */

  tags = {
    #Name = "nets_oa_vpc_1-app-EC2-Solace-PubSub"
    Name = "${format("nets_oa_vpc_1-app-Test-Solace-PubSub-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#10.Provisioning 1x t2.small RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t2-small" {
  count = 2   
  
  ami = var.ami
  instance_type = var.instance_type["t2_small"]
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
    #Name = "nets_oa_vpc_1-app-EC2-Solace-Monitoring"
    Name = "${format("nets_oa_vpc_1-app-Test-Solace-Monitoring-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
} 
