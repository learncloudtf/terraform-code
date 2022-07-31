
#4.Provisioning 4x r5a.2xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-ra5-2xlarge-02" {
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
    Name = "${format("nets_oa_vpc_1-app-Test-sss-backoffice-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#9.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-02" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
  #subnet_id     = var.subnet_id
  subnet_id = "${element(var.subnet_ext_ids_web, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "${format("nets_oa_vpc_1-Test-rtgs-web-portal-1-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#10.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-03" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
  #subnet_id     = var.subnet_id
  subnet_id = "${element(var.subnet_ext_ids_web, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "${format("nets_oa_vpc_1-Test-sss-web-portal-1-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#11.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-04" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
  #subnet_id     = var.subnet_id
  subnet_id = "${element(var.subnet_ext_ids_app, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-backoffice-1-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#12.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-05" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
  #subnet_id     = var.subnet_id
  subnet_id = "${element(var.subnet_ext_ids_app, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "${format("nets_oa_vpc_1-app-Test-sss-backoffice-1-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#13.Provisioning 4x t3.2xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-2xlarge-02" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_2xlarge"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-mpr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#14.Provisioning 4x t3.2xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-2xlarge-03" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_2xlarge"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-bpr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#15.Provisioning 4x t3.2xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-2xlarge-04" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_2xlarge"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-spr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#17.Provisioning 4x t3.xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3-xlarge-01" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3_xlarge"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-batch-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#18.Provisioning 4x r5a.large RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-r5a-large-02" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["r5a_large"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-report-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#19.Provisioning 4x t3a.large RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-large-02" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_large"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-rtgs-task-scheduler-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#20.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-06" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-sss-mpr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#21.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-07" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-sss-bpr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}



#22.Provisioning 4x t3a.medium RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-medium-08" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_medium"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-sss-spr-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}

#23.Provisioning 4x r5a.xlarge RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-r5a-xlarge-02" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["r5a_xlarge"]
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
    Name = "${format("nets_oa_vpc_1-app-Test-sss-batch + sss-task-schedule-%03d", count.index + 1)}"
    Environment = "Test"
    Backup = "Yes"
   }
}



#2[RDBMS-rescued].Provisioning 3x r5a.2xlarge RHEL Linux machine with 700GB EBS (OS: 200GB, Data: 500GB) DB_subent
resource "aws_instance" "Machine-ra5-2xlarge-02-rescued" {
  count = 1   
  
  ami = "ami-008e55a3d2f92e59f"
  instance_type = var.instance_type["r5a_2xlarge"]
  subnet_id = "${element(var.subnet_ids_db, count.index)}"
  key_name      = var.key_name
  /*
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
  */
  tags = {
    #Name = "nets_oa_vpc_1-EC2-RDBMS"
    Name = "nets_oa_vpc_1-Test-RDBMS-004"
    Environment = "Test"
    Backup = "Yes"
   }

}

#.Provisioning 4x t3a.large RHEL Linux machine with 100GB EBS (OS: 100GB) app_subent
resource "aws_instance" "Machine-t3a-large-solace" {
  count = 4
  ami = var.ami
  instance_type = var.instance_type["t3a_large"]
  #subnet_id     = var.subnet_id
  subnet_id = "${element(var.subnet_ext_ids_app, count.index)}"
  key_name      = var.key_name
  # root disk
  root_block_device {
    volume_size           = "100"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "${format("nets_oa_vpc_1-app-Test-Solace-PubSub-%03d", count.index + 5)}"
    Environment = "Test"
    Backup = "Yes"
   }
}