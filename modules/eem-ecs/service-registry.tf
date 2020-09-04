resource "aws_service_discovery_private_dns_namespace" "eem-service-discovery" {
  name = "ecs.local"
  vpc  = var.vpc_id
}

resource "aws_service_discovery_service" "eem-kafka-schema-registry" {
  name = "eem-kafka-schema-registry"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.eem-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "eem-kafka-connect" {
  name = "eem-kafka-connect"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.eem-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "eem-kafka-ksql" {
  name = "eem-kafka-ksql"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.eem-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}