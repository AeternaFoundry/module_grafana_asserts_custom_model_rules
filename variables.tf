variable "asserts_custom_model_rules" {
  description = <<EOT
Map of asserts_custom_model_rules, attributes below
Required:
    - name
    - rules (block):
        - entity (required, block):
            - defined_by (required, block):
                - disabled (optional)
                - label_values (optional)
                - literals (optional)
                - metric_value (optional)
                - query (required)
            - disabled (optional)
            - enriched_by (optional)
            - lookup (optional)
            - name (required)
            - scope (optional)
            - type (required)
EOT

  type = map(object({
    name = string
    rules = object({
      entity = list(object({
        defined_by = list(object({
          disabled     = optional(bool)
          label_values = optional(map(string))
          literals     = optional(map(string))
          metric_value = optional(string)
          query        = string
        }))
        disabled    = optional(bool)
        enriched_by = optional(list(string))
        lookup      = optional(map(string))
        name        = string
        scope       = optional(map(string))
        type        = string
      }))
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.asserts_custom_model_rules : (
        length(v.rules.entity) >= 1
      )
    ])
    error_message = "Each entity list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.asserts_custom_model_rules : (
        alltrue([for item in v.rules.entity : (length(item.defined_by) >= 1)])
      )
    ])
    error_message = "Each defined_by list must contain at least 1 items"
  }
}

