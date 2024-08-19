resource "oci_identity_compartment" "this" {
  count          = length(var.compartment)
  compartment_id = lookup(var.compartment[count.index], "compartment_id")
  defined_tags   = merge(var.defined_tags, lookup(var.compartment[count.index], "defined_tags"))
  description    = lookup(var.compartment[count.index], "description")
  freeform_tags  = merge(var.freeform_tags, lookup(var.compartment[count.index], "freeform_tags"))
  name           = lookup(var.compartment[count.index], "name")
  enable_delete  = lookup(var.compartment[count.index], "enable_delete")
}

resource "oci_identity_api_key" "this" {
  count     = length(var.user) == 0 ? 0 : length(var.api_key)
  user_id   = lookup(var.api_key[count.index], "user_id")
  key_value = lookup(var.api_key[count.index], "key_value")
}

resource "oci_identity_authentication_policy" "this" {
  count          = length(var.compartment) == 0 ? 0 : length(var.authentication_policy)
  compartment_id = try(element(oci_identity_compartment.this.*.id, lookup(var.authentication_policy[count.index], "compartment_id")))

  dynamic "network_policy" {
    for_each = lookup(var.authentication_policy[count.index], "network_policy") == null ? [] : ["network_policy"]
    content {
      network_source_ids = [lookup(network_policy.value, "network_source_ids")]
    }
  }

  dynamic "password_policy" {
    for_each = lookup(var.authentication_policy[count.index], "password_policy") == null ? [] : ["password_policy"]
    content {
      is_lowercase_characters_required = lookup(password_policy.value, "is_lowercase_characters_required")
      is_numeric_characters_required   = lookup(password_policy.value, "is_numeric_characters_required")
      is_special_characters_required   = lookup(password_policy.value, "is_special_characters_required")
      is_uppercase_characters_required = lookup(password_policy.value, "is_uppercase_characters_required")
      is_username_containment_allowed  = lookup(password_policy.value, "is_username_containment_allowed")
      minimum_password_length          = lookup(password_policy.value, "minimum_password_length")
    }
  }
}


resource "oci_identity_auth_token" "this" {
  count       = length(var.user) == 0 ? 0 : length(var.auth_token)
  user_id     = try(element(oci_identity_user.this.*.id, lookup(var.compartment[count.index], "user_id")))
  description = lookup(var.auth_token[count.index], "description")
}

resource "oci_identity_customer_secret_key" "this" {
  count        = length(var.user) == 0 ? 0 : length(var.customer_secret_key)
  display_name = lookup(var.customer_secret_key[count.index], "display_name")
  user_id      = try(element(oci_identity_user.this.*.id, lookup(var.customer_secret_key[count.index], "user_id")))
}

resource "oci_identity_db_credential" "this" {
  count       = length(var.user) == 0 ? 0 : length(var.db_credential)
  description = lookup(var.db_credential[count.index], "description")
  password    = sensitive(lookup(var.db_credential[count.index], "password"))
  user_id     = try(element(oci_identity_user.this.*.id, lookup(var.db_credential[count.index], "user_id")))
}

resource "oci_identity_domain" "this" {
  count                     = length(var.compartment) == 0 ? 0 : length(var.domain)
  compartment_id            = try(element(oci_identity_compartment.this.*.id, lookup(var.domain[count.index], "compartment_id")))
  description               = lookup(var.domain[count.index], "description")
  display_name              = lookup(var.domain[count.index], "display_name")
  home_region               = lookup(var.domain[count.index], "home_region")
  license_type              = lookup(var.domain[count.index], "license_type")
  admin_email               = lookup(var.domain[count.index], "admin_email")
  admin_first_name          = lookup(var.domain[count.index], "admin_first_name")
  admin_last_name           = lookup(var.domain[count.index], "admin_last_name")
  admin_user_name           = lookup(var.domain[count.index], "admin_user_name")
  defined_tags              = merge(var.defined_tags, lookup(var.domain[count.index], "defined_tags"))
  freeform_tags             = merge(var.freeform_tags, lookup(var.domain[count.index], "freeform_tags"))
  is_hidden_on_login        = lookup(var.domain[count.index], "is_hidden_on_login")
  is_notification_bypassed  = lookup(var.domain[count.index], "is_notification_bypassed")
  is_primary_email_required = lookup(var.domain[count.index], "is_primary_email_required")
}

resource "oci_identity_domain_replication_to_region" "this" {
  count          = length(var.domain) == 0 ? 0 : length(var.domain_replication_to_region)
  domain_id      = try(element(oci_identity_domain.this.*.id, lookup(var.domain_replication_to_region[count.index], "domain_id")))
  replica_region = lookup(var.domain_replication_to_region[count.index], "replica_region")
}

resource "oci_identity_dynamic_group" "this" {
  count          = length(var.compartment) == 0 ? 0 : length(var.dynamic_group)
  compartment_id = try(element(oci_identity_compartment.this.*.id, lookup(var.dynamic_group[count.index], "compartment_id")))
  description    = lookup(var.dynamic_group[count.index], "description")
  matching_rule  = lookup(var.dynamic_group[count.index], "matching_rule")
  name           = lookup(var.dynamic_group[count.index], "name")
  defined_tags   = merge(var.defined_tags, lookup(var.dynamic_group[count.index], "defined_tags"))
  freeform_tags  = merge(var.freeform_tags, lookup(var.dynamic_group[count.index], "freeform_tags"))
}

resource "oci_identity_group" "this" {
  count          = length(var.compartment) == 0 ? 0 : length(var.group)
  description    = lookup(var.group[count.index], "description")
  name           = lookup(var.group[count.index], "name")
  compartment_id = try(element(oci_identity_compartment.this.*.id, lookup(var.group[count.index], "compartment_id")))
  freeform_tags  = merge(var.freeform_tags, lookup(var.group[count.index], "freeform_tags"))
  defined_tags   = merge(var.defined_tags, lookup(var.group[count.index], "defined_tags"))
}

resource "oci_identity_identity_provider" "this" {
  count               = length(var.compartment) == 0 ? 0 : length(var.identity_provider)
  compartment_id      = try(element(oci_identity_compartment.this.*.id, lookup(var.identity_provider[count.index], "compartment_id")))
  description         = lookup(var.identity_provider[count.index], "description")
  metadata            = lookup(var.identity_provider[count.index], "metadata")
  metadata_url        = lookup(var.identity_provider[count.index], "metadata_url")
  name                = lookup(var.identity_provider[count.index], "name")
  product_type        = lookup(var.identity_provider[count.index], "product_type")
  protocol            = lookup(var.identity_provider[count.index], "protocol")
  defined_tags        = merge(var.defined_tags, lookup(var.identity_provider[count.index], "defined_tags"))
  freeform_attributes = lookup(var.identity_provider[count.index], "freeform_attributes")
  freeform_tags       = merge(var.freeform_tags, lookup(var.identity_provider[count.index], "freeform_tags"))
}

resource "oci_identity_idp_group_mapping" "this" {
  count                = (length(var.group) && length(var.identity_provider)) == 0 ? 0 : length(var.idp_group_mapping)
  group_id             = try(element(oci_identity_group.this.*.id, lookup(var.idp_group_mapping[count.index], "group_id")))
  identity_provider_id = try(element(oci_identity_identity_provider.this.*.id, lookup(var.idp_group_mapping[count.index], "identity_provider_id")))
  idp_group_name       = lookup(var.idp_group_mapping[count.index], "idp_group_name")
}

resource "oci_identity_import_standard_tags_management" "this" {
  count                       = length(var.compartment) == 0 ? 0 : length(var.import_standard_tags_management)
  compartment_id              = try(element(oci_identity_compartment.this.*.id, lookup(var.import_standard_tags_management[count.index], "comportment_id")))
  standard_tag_namespace_name = lookup(var.import_standard_tags_management[count.index], "standard_tag_namespace_name")
}

resource "oci_identity_network_source" "this" {
  count              = length(var.compartment) == 0 ? 0 : length(var.network_source)
  compartment_id     = try(element(oci_identity_compartment.this.*.id, lookup(var.network_source[count.index], "compartment_id")))
  description        = lookup(var.network_source[count.index], "description")
  name               = lookup(var.network_source[count.index], "name")
  defined_tags       = merge(var.defined_tags, lookup(var.network_source[count.index], "defined_tags"))
  freeform_tags      = merge(var.freeform_tags, lookup(var.network_source[count.index], "freeform_tags"))
  public_source_list = lookup(var.network_source[count.index], "public_source_list")
  services           = lookup(var.network_source[count.index], "services")

  dynamic "virtual_source_list" {
    for_each = lookup(var.network_source[count.index], "virtual_source_list") == null ? [] : ["virtual_source_list"]
    content {
      ip_ranges = lookup(virtual_source_list.value, "ip_ranges")
      vcn_id    = lookup(virtual_source_list.value, "vcn_id")
    }
  }
}

resource "oci_identity_policy" "this" {
  count          = length(var.compartment) == 0 ? 0 : length(var.policy)
  compartment_id = try(element(oci_identity_compartment.this.*.id, lookup(var.policy[count.index], "compartment_id")))
  description    = lookup(var.policy[count.index], "description")
  name           = lookup(var.policy[count.index], "name")
  statements     = lookup(var.policy[count.index], "statements")
  defined_tags   = merge(var.defined_tags, lookup(var.policy[count.index], "defined_tags"))
  freeform_tags  = merge(var.freeform_tags, lookup(var.policy[count.index], "freeform_tags"))
  version_date   = lookup(var.policy[count.index], "version_date")
}

resource "oci_identity_smtp_credential" "this" {
  count       = length(var.user) == 0 ? 0 : length(var.smtp_credential)
  description = lookup(var.smtp_credential[count.index], "description")
  user_id     = try(element(oci_identity_user.this.*.id, lookup(var.smtp_credential[count.index], "user_id")))
}

resource "oci_identity_tag" "this" {
  count            = length(var.tag_namespace) == 0 ? 0 : length(var.tag)
  description      = lookup(var.tag[count.index], "description")
  name             = lookup(var.tag[count.index], "name")
  tag_namespace_id = ""
  defined_tags     = merge(var.defined_tags, lookup(var.tag[count.index], "defined_tags"))
  freeform_tags    = merge(var.freeform_tags, lookup(var.tag[count.index], "freeform_tags"))
  is_cost_tracking = lookup(var.tag[count.index], "is_cost_tracking")
  is_retired       = lookup(var.tag[count.index], "is_retired")

  dynamic "validator" {
    for_each = lookup(var.tag[count.index], "tag") == null ? [] : ["tag"]
    content {
      validator_type = lookup(validator.value, "validator_type")
      values         = lookup(validator.value, "values")
    }
  }
}

resource "oci_identity_tag_default" "this" {
  count             = (length(var.compartment) && length(var.tag)) == 0 ? 0 : length(var.tag_default)
  compartment_id    = try(element(oci_identity_compartment.this.*.id, lookup(var.tag_default[count.index], "compartment_id")))
  tag_definition_id = try(element(oci_identity_tag_default.this.*.tag_definition_id, lookup(var.tag_default[count.index], "tag_definition_id")))
  value             = lookup(var.tag_default[count.index], "value")
  is_required       = lookup(var.tag_default[count.index], "is_required")
}

resource "oci_identity_tag_namespace" "this" {
  count          = length(var.tag_namespace)
  compartment_id = try(element(oci_identity_compartment.this.*.compartment_id, lookup(var.tag_namespace[count.index], "compartment_id")))
  description    = lookup(var.tag_namespace[count.index], "description")
  name           = lookup(var.tag_namespace[count.index], "name")
  defined_tags   = merge(var.defined_tags, lookup(var.tag_namespace[count.index], "defined_tags"))
  freeform_tags  = merge(var.freeform_tags, lookup(var.tag_namespace[count.index], "freeform_tags"))
  is_retired     = lookup(var.tag_namespace[count.index], "is_retired")
}

resource "oci_identity_ui_password" "this" {
  count   = length(var.user) == 0 ? 0 : length(var.ui_password)
  user_id = try(element(oci_identity_user.this.*.id, lookup(var.ui_password[count.index], "user_id")))
}

resource "oci_identity_user" "this" {
  count       = length(var.user)
  description = lookup(var.user[count.index], "description")
  name        = lookup(var.user[count.index], "name")
}

resource "oci_identity_user_capabilities_management" "this" {
  count                        = length(var.user) == 0 ? 0 : length(var.user_capabilities_management)
  user_id                      = try(element(oci_identity_user.this.*.id, lookup(var.user_capabilities_management[count.index], "user_id")))
  can_use_api_keys             = lookup(var.user_capabilities_management[count.index], "can_use_api_keys")
  can_use_auth_tokens          = lookup(var.user_capabilities_management[count.index], "can_use_auth_tokens")
  can_use_console_password     = lookup(var.user_capabilities_management[count.index], "can_use_console_password")
  can_use_customer_secret_keys = lookup(var.user_capabilities_management[count.index], "can_use_customer_secret_keys")
  can_use_smtp_credentials     = lookup(var.user_capabilities_management[count.index], "can_use_smtp_credentials")
}

resource "oci_identity_user_group_membership" "this" {
  count    = (length(var.group) && length(var.user)) == 0 ? 0 : length(var.user_group_membership)
  group_id = try(element(oci_identity_group.this.*.id, lookup(var.user_group_membership, "group_id")))
  user_id  = try(element(oci_identity_user.this.*.id, lookup(var.user_group_membership, "user_id")))
}