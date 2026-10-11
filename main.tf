resource "grafana_asserts_custom_model_rules" "asserts_custom_model_rules" {
  for_each = var.asserts_custom_model_rules

  name = each.value.name

  rules {
    dynamic "entity" {
      for_each = each.value.rules.entity
      content {
        dynamic "defined_by" {
          for_each = entity.value.defined_by
          content {
            disabled     = defined_by.value.disabled
            label_values = defined_by.value.label_values
            literals     = defined_by.value.literals
            metric_value = defined_by.value.metric_value
            query        = defined_by.value.query
          }
        }
        disabled    = entity.value.disabled
        enriched_by = entity.value.enriched_by
        lookup      = entity.value.lookup
        name        = entity.value.name
        scope       = entity.value.scope
        type        = entity.value.type
      }
    }
  }
}

