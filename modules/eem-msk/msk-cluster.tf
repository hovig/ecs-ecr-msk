resource "aws_kms_key" "eem-msk" {
  description = "eem-msk"
}

resource "aws_security_group" "eem-msk" {
  name        = "eem-msk"
  description = "eem-msk security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_msk_configuration" "eem-msk" {
  kafka_versions = [var.msk_kafka_version]
  name           = var.msk_configuration_name

  server_properties = <<PROPERTIES
min.insync.replicas = ${var.msk_min_in_sync_replicas}
default.replication.factor = ${var.msk_default_replication_factor}
auto.create.topics.enable = true
delete.topic.enable = true
PROPERTIES
}

resource "aws_msk_cluster" "eem-msk" {
  cluster_name           = "eem-msk"
  enhanced_monitoring    = "DEFAULT"
  kafka_version          = var.msk_kafka_version
  number_of_broker_nodes = var.msk_number_of_brokers
  tags                   = {}

  broker_node_group_info {
    az_distribution = "DEFAULT"
    client_subnets  = var.subnet_ids
    security_groups = [aws_security_group.eem-msk.id]
    ebs_volume_size = var.msk_ebs_volume_size
    instance_type   = var.msk_instance_type
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.eem-msk.arn
    encryption_in_transit {
      client_broker = var.msk_encryption_data_in_transit
      in_cluster    = true
    }
  }

  configuration_info {
    arn      = aws_msk_configuration.eem-msk.arn
    revision = aws_msk_configuration.eem-msk.latest_revision
  }
}
