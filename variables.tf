variable "elasticsearch_domains" {
  description = <<EOT
Map of elasticsearch_domains, attributes below
Required:
    - domain_name
Optional:
    - access_policies
    - advanced_options
    - elasticsearch_version
    - region
    - tags
    - tags_all
    - advanced_security_options (block):
        - enabled (required)
        - internal_user_database_enabled (optional)
        - master_user_options (optional, block):
            - master_user_arn (optional)
            - master_user_name (optional)
            - master_user_password (optional)
    - auto_tune_options (block):
        - desired_state (required)
        - maintenance_schedule (optional, block):
            - cron_expression_for_recurrence (required)
            - duration (required, block):
                - unit (required)
                - value (required)
            - start_at (required)
        - rollback_on_disable (optional)
    - cluster_config (block):
        - cold_storage_options (optional, block):
            - enabled (optional)
        - dedicated_master_count (optional)
        - dedicated_master_enabled (optional)
        - dedicated_master_type (optional)
        - instance_count (optional)
        - instance_type (optional)
        - warm_count (optional)
        - warm_enabled (optional)
        - warm_type (optional)
        - zone_awareness_config (optional, block):
            - availability_zone_count (optional)
        - zone_awareness_enabled (optional)
    - cognito_options (block):
        - enabled (optional)
        - identity_pool_id (required)
        - role_arn (required)
        - user_pool_id (required)
    - domain_endpoint_options (block):
        - custom_endpoint (optional)
        - custom_endpoint_certificate_arn (optional)
        - custom_endpoint_enabled (optional)
        - enforce_https (optional)
        - tls_security_policy (optional)
    - ebs_options (block):
        - ebs_enabled (required)
        - iops (optional)
        - throughput (optional)
        - volume_size (optional)
        - volume_type (optional)
    - encrypt_at_rest (block):
        - enabled (required)
        - kms_key_id (optional)
    - log_publishing_options (block):
        - cloudwatch_log_group_arn (required)
        - enabled (optional)
        - log_type (required)
    - node_to_node_encryption (block):
        - enabled (required)
    - snapshot_options (block):
        - automated_snapshot_start_hour (required)
    - vpc_options (block):
        - security_group_ids (optional)
        - subnet_ids (optional)
EOT

  type = map(object({
    domain_name           = string
    access_policies       = optional(string)
    advanced_options      = optional(map(string))
    elasticsearch_version = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    advanced_security_options = optional(object({
      enabled                        = bool
      internal_user_database_enabled = optional(bool)
      master_user_options = optional(object({
        master_user_arn      = optional(string)
        master_user_name     = optional(string)
        master_user_password = optional(string)
      }))
    }))
    auto_tune_options = optional(object({
      desired_state = string
      maintenance_schedule = optional(list(object({
        cron_expression_for_recurrence = string
        duration = object({
          unit  = string
          value = number
        })
        start_at = string
      })))
      rollback_on_disable = optional(string)
    }))
    cluster_config = optional(object({
      cold_storage_options = optional(object({
        enabled = optional(bool)
      }))
      dedicated_master_count   = optional(number)
      dedicated_master_enabled = optional(bool)
      dedicated_master_type    = optional(string)
      instance_count           = optional(number)
      instance_type            = optional(string)
      warm_count               = optional(number)
      warm_enabled             = optional(bool)
      warm_type                = optional(string)
      zone_awareness_config = optional(object({
        availability_zone_count = optional(number)
      }))
      zone_awareness_enabled = optional(bool)
    }))
    cognito_options = optional(object({
      enabled          = optional(bool)
      identity_pool_id = string
      role_arn         = string
      user_pool_id     = string
    }))
    domain_endpoint_options = optional(object({
      custom_endpoint                 = optional(string)
      custom_endpoint_certificate_arn = optional(string)
      custom_endpoint_enabled         = optional(bool)
      enforce_https                   = optional(bool)
      tls_security_policy             = optional(string)
    }))
    ebs_options = optional(object({
      ebs_enabled = bool
      iops        = optional(number)
      throughput  = optional(number)
      volume_size = optional(number)
      volume_type = optional(string)
    }))
    encrypt_at_rest = optional(object({
      enabled    = bool
      kms_key_id = optional(string)
    }))
    log_publishing_options = optional(list(object({
      cloudwatch_log_group_arn = string
      enabled                  = optional(bool)
      log_type                 = string
    })))
    node_to_node_encryption = optional(object({
      enabled = bool
    }))
    snapshot_options = optional(object({
      automated_snapshot_start_hour = number
    }))
    vpc_options = optional(object({
      security_group_ids = optional(set(string))
      subnet_ids         = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.elasticsearch_domains : (
        v.cluster_config == null || (v.cluster_config.warm_count == null || (v.cluster_config.warm_count >= 2 && v.cluster_config.warm_count <= 150))
      )
    ])
    error_message = "must be between 2 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.elasticsearch_domains : (
        v.cluster_config == null || (v.cluster_config.zone_awareness_config == null || (v.cluster_config.zone_awareness_config.availability_zone_count == null || (contains([2, 3], v.cluster_config.zone_awareness_config.availability_zone_count))))
      )
    ])
    error_message = "must be one of: 2, 3"
  }
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

