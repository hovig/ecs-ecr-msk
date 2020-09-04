output "eem-vpc" {
  description = "eem VPC"
  value       = "${aws_vpc.eem-vpc.id}"
}

output "eem-public-subnet-a" {
  description = "Public Subnet a"
  value       = "${aws_subnet.eem-public-subnet-a.id}"
}

output "eem-public-subnet-b" {
  description = "Public Subnet b"
  value       = "${aws_subnet.eem-public-subnet-b.id}"
}

output "eem-public-subnet-c" {
  description = "Public Subnet c"
  value       = "${aws_subnet.eem-public-subnet-c.id}"
}