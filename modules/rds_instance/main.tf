resource "aws_security_group" "this" {
    vpc_id          = "${var.vpc_id}"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  tags {
    Name            = "${var.sg_name}"
    description     = "Managed by Terraform"
  }
}

resource "aws_db_subnet_group" "this" {
    name        = "${var.subnet_group_name}"
    description = "Managed by Terraform"
    subnet_ids  = ["${var.subnet_ids}"]

    tags {
        Name            = "${var.subnet_group_name}"
        description     = "Managed by Terraform"
    }
}

resource "aws_db_instance" "this" {
  identifier                  = "${var.identifier}"

  engine                      = "${var.engine}"
  engine_version              = "${var.engine_version}"
  instance_class              = "${var.instance_class}"

  storage_type                = "${var.storage_type}"
  allocated_storage           = "${var.allocated_storage}"

  name                        = "${var.db_name}"
  username                    = "${var.db_username}"
  password                    = "${var.db_password}"
  port                        = "${var.db_port}"

  vpc_security_group_ids      = ["${aws_security_group.rds_mysql.id}"]
  db_subnet_group_name        = "${aws_db_subnet_group.mysql-subnet-group.name}"
  parameter_group_name        = "${var.parameter_group_name}"

  multi_az                    = "${var.is_multi_az}"
  publicly_accessible         = "${var.publicly_accessible}"
  monitoring_interval         = "${var.monitoring_interval}"

  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  apply_immediately           = "${var.apply_immediately}"
  maintenance_window          = "${var.maintenance_window}"

  final_snapshot_identifier = "${var.identifier}-${md5(timestamp())}"

  backup_retention_period     = "${var.backup_retention_period}"
  backup_window               = "${var.backup_window}"

  tags {
    Name                      = "${var.identifier}"
    description               = "Managed by Terraform"
  }
}
