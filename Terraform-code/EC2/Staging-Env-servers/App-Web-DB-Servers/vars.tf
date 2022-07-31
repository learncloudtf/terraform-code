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
    }
}

variable "key_name" {     
  type = string
}



variable "subnet_ids_app" {
  default =  [ "subnet-0fbeb4cf8a67f2256", "subnet-03c8d8193a6106dd1"]
}
variable "subnet_ids_web" {
  default =  [ "subnet-0ceb75a0519ff4b95", "subnet-0be1cdba792764101" ]
}
variable "subnet_ids_db" {
  default =  [ "subnet-080eaace1498f665c", "subnet-0ea08e5663efa6f26" ]
}