output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.rds.address
}

output "rds_password" {
  value     = random_password.rds_password.result
  sensitive = true
}
output "vpc2_cidr" {
  value = aws_instance.private_ec2
}


