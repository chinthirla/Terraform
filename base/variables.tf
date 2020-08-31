variable "access_key" {
  description = "Aws Access key"
  default = "AKIAWG2S6RCSIOEBEJWS"
}
variable "secret_key" {
  description = "aws secret key"
  default = "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"
}
#using variable type string
variable "region" {
  type = "string"
  description = "Region of aws instance"
  default = "us-east-1"
}
#using variable type list
variable "ami" {
  description = "aws instance region"
  type = "map"
  default = {
    us-east-1 = "ami-0d729a60"
    us-west-1 = "ami-7c4b331c"
  }
}
#using variable type list
variable "region_list" {
  description = "aws instance region list"
  default = ["us-east-1a","us-east-1b"]
}
variable "security_group_ids" {
  description = "aws instance security group"
  default = "sg-ff74d1dd"
  #default list varibale example
  #default = ["${var.security_group_ids}"]
  #Retriving single element from list
  #vpc_security_group_ids = "${var.security_group_ids[1]}"
  #passing variable in command lines
  #terraform plan -var 'access_key=abc123' -var 'secret_key='abc123'
}