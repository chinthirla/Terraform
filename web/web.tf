resource "aws_instance" "web" {
  subnet = "${var.env == "production" ? var.prod_subnet : var.dev_subnet}"
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
