variable "access_key" {
description = "The AWS access key."
}
variable "secret_key" {
description = "The AWS secret key."
}
variable "region" {
type = "string"
description = "The Aws Region."
default = "us-east-1"
}
variable "region_list" {
description = "Aws availability zone"
type = "list"
default = ["us-east-1a", "us-east-1b"]
}
variable "ami" {
type = "map"
default = {
us-east-1 = "ami-0d729a60"
us-west-1 = "ami-7c4b331c"
}
description = "AWS ami images"
}
variable "security_group_ids" {
type = "list"
description = "List of AWS security group ids"
default = ["sg-4f713c35", "sg-4f713c35", "sg-4f713c35"]
}

