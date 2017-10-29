output "instance_address" {
    description = "The address of the RDS instance"
    value       = "${aws_db_instance.this.address}"
}

output "instance_arn" {
    description = "The ARN of the RDS instance"
    value       = "${aws_db_instance.this.arn}"
}

output "instance_endpoint" {
    description = "The connection endpoint"
    value       = "${aws_db_instance.this.endpoint}"
}

output "instance_id" {
  description = "The RDS instance ID"
  value       = "${aws_db_instance.this.id}"
}

output "security_group_id" {
    description = "The RDS Security Group ID"
    value       = "${aws_security_group.this.id}"
}

output "instance_identifier" {
    value = "${aws_db_instance.this.identifier}"
}
