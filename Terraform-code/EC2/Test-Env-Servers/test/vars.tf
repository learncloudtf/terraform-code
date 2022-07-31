variable "ami" {       
  type = string
}
# Creating a Variable for instance_type
variable "instance_type" {    
  type        = map
   default = {
    r5a_2xlarge = "r5a.2xlarge"
    r5a_xlarge  = "r5a.xlarge"
    r5a_large   = "r5a.large"
    t3a_2xlarge = "t3a.2xlarge"
    t3a_xlarge = "t3a.xlarge"
    t3a_large = "t3a.large"
    t3a_medium = "t3a.medium"
    t2_small = "t2.small"
    t3_xlarge	= "t3.xlarge"
    c5_xlarge = "c5.xlarge"
    }
}

variable "key_name" {     
  type = string
}



variable "subnet_ids_app" {
  default =  [ "subnet-063ae083c989d4ba0", "subnet-0c3422f80660db13b"]
}
variable "subnet_ids_web" {
  default =  [ "subnet-0329d20dc4bf6fff7", "subnet-0c196e88f4e11d044" ]
}
variable "subnet_ids_db" {
  default =  [ "subnet-00aa24c7e29a6b243", "subnet-0aace26fdc26e10aa" ]
}