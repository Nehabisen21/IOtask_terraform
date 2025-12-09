resource "aws_db_instance" "rds" {
  allocated_storage      = var.db_allocated_storage
  engine                 = "mysql"
  engine_version         = "8.0"
  storage_type           = var.storage_type
  username               = "admin"
  password               = random_password.rds_password.result
  instance_class         = var.db_instance_class
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
  apply_immediately      = true ##not for production it chsnges the things immediately

}

###Random password for RDS
resource "random_password" "rds_password" {
  length           = 15
  special          = true
  override_special = "!#$%^&*()_+-=?"
}


#####AWS Secret Manager
resource "aws_secretsmanager_secret" "rds_secrets" {
  name        = "rds-credentials-05" ##have to change when applying
  description = "User and Password of RDS "
}

####JSON secret bcoz it store secret in key value pair

resource "aws_secretsmanager_secret_version" "rds_secret_value" { ##This stores the actual secret value in the secret created above.
  secret_id = aws_secretsmanager_secret.rds_secrets.id

  secret_string = jsonencode({ ##ASM expect secret in string value commonly json
    username = "admin"
    password = random_password.rds_password.result
  })
}
