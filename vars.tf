## TAGS ##

variable "freeform_tags" {
  type    = map(string)
  default = {}
}

variable "defined_tags" {
  type    = map(string)
  default = {}
}

## RESOURCES ##

variable "api_key" {
  type = list(object({
    id        = number
    key_value = string
    user_id   = any
  }))
  default = []
}

variable "authentication_policy" {
  type = list(object({
    id          = number
    description = string
    user_id     = any
    network_policy = optional(list(object({
      network_source_ids = any
    })))
    password_policy = optional(list(object({
      is_lowercase_characters_required = optional(bool)
      is_numeric_characters_required   = optional(bool)
      is_special_characters_required   = optional(bool)
      is_uppercase_characters_required = optional(bool)
      is_username_containment_allowed  = optional(bool)
      minimum_password_length          = optional(number)
    })))
  }))
  default = []
}

variable "auth_token" {
  type = list(object({
    id          = number
    user_id     = any
    description = string
  }))
  default = []
}

variable "compartment" {
  type = list(object({
    id             = number
    compartment_id = any
    defined_tags   = optional(map(string))
    description    = string
    freeform_tags  = optional(map(string))
    name           = string
    enable_delete  = optional(bool)
  }))
  default     = []
  description = <<EOF
compartment_id - (Required) (Updatable) The OCID of the parent compartment containing the compartment.
defined_tags - (Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see Resource Tags. Example: {"Operations.CostCenter": "42"}
description - (Required) (Updatable) The description you assign to the compartment during creation. Does not have to be unique, and it's changeable.
freeform_tags - (Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see Resource Tags. Example: {"Department": "Finance"}
name - (Required) (Updatable) The name you assign to the compartment during creation. The name must be unique across all compartments in the parent compartment. Avoid entering confidential information.
enable_delete - (Optional) Defaults to false. If omitted or set to false the provider will implicitly import the compartment if there is a name collision, and will not actually delete the compartment on destroy or removal of the resource declaration. If set to true, the provider will throw an error on a name collision with another compartment, and will attempt to delete the compartment on destroy or removal of the resource declaration.
EOF
}

variable "customer_secret_key" {
  type = list(object({
    id           = number
    display_name = string
    user_id      = any
  }))
  default = []
}

variable "db_credential" {
  type = list(object({
    id          = number
    description = string
    password    = string
    user_id     = string
  }))
  default = []
}

variable "domain" {
  type = list(object({
    id                        = number
    compartment_id            = any
    description               = string
    display_name              = string
    home_region               = string
    license_type              = string
    admin_email               = optional(string)
    admin_first_name          = optional(string)
    admin_last_name           = optional(string)
    admin_user_name           = optional(string)
    defined_tags              = optional(map(string))
    freeform_tags             = optional(map(string))
    is_hidden_on_login        = optional(bool)
    is_notification_bypassed  = optional(bool)
    is_primary_email_required = optional(bool)
  }))
  default = []
}

variable "domain_replication_to_region" {
  type = list(object({
    id             = number
    domain_id      = any
    replica_region = string
  }))
  default = []
}

variable "dynamic_group" {
  type = list(object({
    id             = number
    compartment_id = any
    description    = string
    matching_rule  = string
    name           = string
    defined_tags   = optional(map(string))
    freeform_tags  = optional(map(string))
  }))
  default = []
}

variable "group" {
  type = list(object({
    id             = number
    description    = string
    name           = string
    compartment_id = any
    freeform_tags  = optional(map(string))
    defined_tags   = optional(map(string))
  }))
  default = []
}

variable "identity_provider" {
  type = list(object({
    id                  = number
    compartment_id      = any
    description         = string
    metadata            = string
    metadata_url        = string
    name                = string
    product_type        = string
    protocol            = string
    defined_tags        = optional(map(string))
    freeform_attributes = optional(map(string))
    freeform_tags       = optional(map(string))
  }))
  default = []
}

variable "idp_group_mapping" {
  type = list(object({
    id                   = number
    group_id             = any
    identity_provider_id = any
    idp_group_name       = string
  }))
  default = []
}

variable "import_standard_tags_management" {
  type = list(object({
    id                          = number
    compartment_id              = any
    standard_tag_namespace_name = string
  }))
  default = []
}

variable "network_source" {
  type = list(object({
    id                 = number
    compartment_id     = any
    description        = string
    name               = string
    defined_tags       = optional(map(string))
    freeform_tags      = optional(map(string))
    public_source_list = optional(list(string))
    services           = optional(list(string))
    virtual_source_list = optional(list(object({
      ip_ranges = list(string)
      vcn_id    = string
    })))
  }))
  default = []
}

variable "policy" {
  type = list(object({
    id             = number
    compartment_id = any
    description    = string
    name           = string
    statements     = list(string)
    defined_tags   = optional(map(string))
    freeform_tags  = optional(map(string))
    version_date   = optional(string)
  }))
  default = []
}

variable "smtp_credential" {
  type = list(object({
    id          = number
    description = string
    user_id     = any
  }))
  default = []
}

variable "tag" {
  type = list(object({
    id               = number
    description      = string
    name             = string
    tag_namespace_id = any
    defined_tags     = optional(map(string))
    freeform_tags    = optional(map(string))
    is_cost_tracking = optional(bool)
    is_retired       = optional(bool)
  }))
  default = []
}

variable "tag_default" {
  type = list(object({
    id                = number
    compartment_id    = any
    tag_definition_id = any
    value             = string
    is_required       = optional(bool)
  }))
  default = []
}

variable "tag_namespace" {
  type = list(object({
    id             = number
    compartment_id = any
    description    = string
    name           = string
    defined_tags   = optional(map(string))
    freeform_tags  = optional(map(string))
    is_retired     = optional(bool)
  }))
  default = []
}

variable "ui_password" {
  type = list(object({
    id      = number
    user_id = any
  }))
  default = []
}

variable "user" {
  type = list(object({
    id          = number
    description = string
    name        = string
  }))
  default = []
}

variable "user_capabilities_management" {
  type = list(object({
    id                           = number
    user_id                      = any
    can_use_api_keys             = optional(bool)
    can_use_auth_tokens          = optional(bool)
    can_use_console_password     = optional(bool)
    can_use_customer_secret_keys = optional(bool)
    can_use_smtp_credentials     = optional(bool)
  }))
  default = []
}

variable "user_group_membership" {
  type = list(object({
    id       = number
    group_id = any
    user_id  = any
  }))
  default = []
}
