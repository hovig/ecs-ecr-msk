output "eem-vpc" {
  description = "eem VPC"
  value       = "${module.eem-vpc.eem-vpc}"
}

output "eem-public-subnet-a" {
  description = "Public Subnet a"
  value       = "${module.eem-vpc.eem-public-subnet-a}"
}

output "eem-public-subnet-b" {
  description = "Public Subnet b"
  value       = "${module.eem-vpc.eem-public-subnet-b}"
}

output "eem-public-subnet-c" {
  description = "Public Subnet c"
  value       = "${module.eem-vpc.eem-public-subnet-c}"
}