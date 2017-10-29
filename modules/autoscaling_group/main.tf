resource "aws_security_group" "this" {
    vpc_id      = "${var.vpc_id}"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        Name            = "${var.sg_name}"
        description     = "Managed by Terraform"
    }
}

resource "aws_launch_configuration" "this" {
    name_prefix               = "${var.name_prefix}-"
    image_id                  = "${var.image_id}"
    instance_type             = "${var.instance_type}"
    security_groups           = ["${aws_security_group.sg.id}"]

    root_block_device {
        volume_type           = "${var.root_volume_type}"
        volume_size           = "${var.root_volume_size}"
        delete_on_termination = "${var.root_delete_on_termination}"
    }

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "this" {
    name                      = "${var.asg_name}"
    availability_zones        = ["${data.aws_availability_zones.all.names}"]
    launch_configuration      = "${aws_launch_configuration.this.name}"
    vpc_zone_identifier       = ["${var.subnet_ids}"]

    max_size                  = "${var.max_size}"
    min_size                  = "${var.min_size}"
    desired_capacity          = "${var.desired_capacity}"

    load_balancers            = "${var.load_balancers}"
    health_check_grace_period = "${var.health_check_grace_period}"
    health_check_type         = "${var.health_check_type}"
    default_cooldown          = "${var.default_cooldown}"
    force_delete              = "${var.force_delete}"

    tags = [
        {
            key                 = "Name"
            value               = "${var.asg_name}"
            propagate_at_launch = true
        }
    ]
}
