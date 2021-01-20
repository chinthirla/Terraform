provider "aws" {
 region = "${var.region}"
}
provider "aws" {
  alias = "west"
  region = "us-west-1"
}
resource "aws_instance" "web" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  subnet_id = "${module.vpc.public_subnet_id}"
  associate_public_ip_address = true
  user_data = "${file("files/web_bootstrap.sh")}"
  vpc_security_group_ids = [
    "${aws_security_group.web_host_sg.id}",
  ]
  count = 2
}
#module "vpc" {
#  source = "./vpc"
#  name = "web"
#  cidr = "10.0.0.0/16"
#  public_subnet = "10.0.1.0/24"
#  enable_dns_hostnames = false
#}
#module versioning git::https://github.com/turnbullpress/tf_vpc.git?ref=v0.0.2
module "vpc" {
  source = "github.com/turnbullpress/tf_vpc.git?ref=v0.0.1"
  name = "web"
  cidr = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
}
resource "aws_vpc" "tfb" {
  cidr_block = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support = "${var.enable_dns_support}"
  tags {
    Name = "${var.name}"
  }
}
output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}
output "vpc_id" {
  value = "${aws_vpc.tfb.id}"
}
output "cidr" {
  value = "${aws_vpc.tfb.cidr_block}"
}
resource "aws_instance" "web" {
tags {
  Owner = "${var.owner_tag[count.index]}"
}
count = "${length(var.instance_ips)}"
}
resource "aws_instance" "web" {
ami = "${lookup(var.ami, var.region)}"
count = "${var.environment == "production" ? 4 : 2}"
}
