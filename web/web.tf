provider "aws" {
 region = "${var.region}"
}
provider "aws" {
  alias = "west"
  region = "us-west-1"
}
resource "aws_instance" "web" {
  subnet = "${var.env == "production" ? var.prod_subnet : var.dev_subnet}"
}
module "vpc" {
  source = "./vpc"
  name = "web"
  cidr = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
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
