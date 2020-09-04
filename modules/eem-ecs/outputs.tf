output "ecs-security-group" {
  description = "Plaintext connection host:port pairs"
  value       = "${aws_security_group.eem-ecs.id}"
}