output "elasticsearch_domains_id" {
  description = "Map of id values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.id if v.id != null && length(v.id) > 0 }
}
output "elasticsearch_domains_access_policies" {
  description = "Map of access_policies values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.access_policies if v.access_policies != null && length(v.access_policies) > 0 }
}
output "elasticsearch_domains_advanced_options" {
  description = "Map of advanced_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.advanced_options if v.advanced_options != null && length(v.advanced_options) > 0 }
}
output "elasticsearch_domains_advanced_security_options" {
  description = "Map of advanced_security_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.advanced_security_options) if v.advanced_security_options != null && length(v.advanced_security_options) > 0 }
  sensitive   = true
}
output "elasticsearch_domains_arn" {
  description = "Map of arn values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "elasticsearch_domains_auto_tune_options" {
  description = "Map of auto_tune_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.auto_tune_options) if v.auto_tune_options != null && length(v.auto_tune_options) > 0 }
}
output "elasticsearch_domains_cluster_config" {
  description = "Map of cluster_config values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.cluster_config) if v.cluster_config != null && length(v.cluster_config) > 0 }
}
output "elasticsearch_domains_cognito_options" {
  description = "Map of cognito_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.cognito_options) if v.cognito_options != null && length(v.cognito_options) > 0 }
}
output "elasticsearch_domains_domain_endpoint_options" {
  description = "Map of domain_endpoint_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.domain_endpoint_options) if v.domain_endpoint_options != null && length(v.domain_endpoint_options) > 0 }
}
output "elasticsearch_domains_domain_id" {
  description = "Map of domain_id values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.domain_id if v.domain_id != null && length(v.domain_id) > 0 }
}
output "elasticsearch_domains_domain_name" {
  description = "Map of domain_name values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.domain_name if v.domain_name != null && length(v.domain_name) > 0 }
}
output "elasticsearch_domains_ebs_options" {
  description = "Map of ebs_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.ebs_options) if v.ebs_options != null && length(v.ebs_options) > 0 }
}
output "elasticsearch_domains_elasticsearch_version" {
  description = "Map of elasticsearch_version values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.elasticsearch_version if v.elasticsearch_version != null && length(v.elasticsearch_version) > 0 }
}
output "elasticsearch_domains_encrypt_at_rest" {
  description = "Map of encrypt_at_rest values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.encrypt_at_rest) if v.encrypt_at_rest != null && length(v.encrypt_at_rest) > 0 }
}
output "elasticsearch_domains_endpoint" {
  description = "Map of endpoint values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.endpoint if v.endpoint != null && length(v.endpoint) > 0 }
}
output "elasticsearch_domains_kibana_endpoint" {
  description = "Map of kibana_endpoint values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.kibana_endpoint if v.kibana_endpoint != null && length(v.kibana_endpoint) > 0 }
}
output "elasticsearch_domains_log_publishing_options" {
  description = "Map of log_publishing_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.log_publishing_options if v.log_publishing_options != null && length(v.log_publishing_options) > 0 }
}
output "elasticsearch_domains_node_to_node_encryption" {
  description = "Map of node_to_node_encryption values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.node_to_node_encryption) if v.node_to_node_encryption != null && length(v.node_to_node_encryption) > 0 }
}
output "elasticsearch_domains_region" {
  description = "Map of region values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.region if v.region != null && length(v.region) > 0 }
}
output "elasticsearch_domains_snapshot_options" {
  description = "Map of snapshot_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.snapshot_options) if v.snapshot_options != null && length(v.snapshot_options) > 0 }
}
output "elasticsearch_domains_tags" {
  description = "Map of tags values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "elasticsearch_domains_tags_all" {
  description = "Map of tags_all values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "elasticsearch_domains_vpc_options" {
  description = "Map of vpc_options values across all elasticsearch_domains, keyed the same as var.elasticsearch_domains"
  value       = { for k, v in aws_elasticsearch_domain.elasticsearch_domains : k => one(v.vpc_options) if v.vpc_options != null && length(v.vpc_options) > 0 }
}

