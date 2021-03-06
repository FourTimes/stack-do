resource "aws_instance" "tf" {
  ami                         = var.ami
  associate_public_ip_address = false
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = false
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.tf.id]
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    iops                  = 3000
    throughput            = 125
    volume_size           = 250
    volume_type           = "gp3"
  }
  tags = tomap(var.additional_tags)
  metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "required"
  }
}


resource "aws_security_group" "tf" {
  description = "Security group for PMP Stock Downloader"
  vpc_id      = var.vpc_id
  name        = var.security_group_name

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value
    }
  }

  tags = tomap(var.additional_tags)
}
