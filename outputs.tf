output "asserts_custom_model_rules_id" {
  description = "Map of id values across all asserts_custom_model_rules, keyed the same as var.asserts_custom_model_rules except keys with no id are omitted"
  value       = { for k, v in grafana_asserts_custom_model_rules.asserts_custom_model_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "asserts_custom_model_rules_name" {
  description = "Map of name values across all asserts_custom_model_rules, keyed the same as var.asserts_custom_model_rules except keys with no name are omitted"
  value       = { for k, v in grafana_asserts_custom_model_rules.asserts_custom_model_rules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "asserts_custom_model_rules_rules" {
  description = "Map of rules values across all asserts_custom_model_rules, keyed the same as var.asserts_custom_model_rules except keys with no rules are omitted"
  value       = { for k, v in grafana_asserts_custom_model_rules.asserts_custom_model_rules : k => one(v.rules) if v.rules != null && length(v.rules) > 0 }
}

