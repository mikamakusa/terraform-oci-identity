## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 6.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 6.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_api_key.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_api_key) | resource |
| [oci_identity_auth_token.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_auth_token) | resource |
| [oci_identity_authentication_policy.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_authentication_policy) | resource |
| [oci_identity_compartment.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_identity_customer_secret_key.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_customer_secret_key) | resource |
| [oci_identity_db_credential.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_db_credential) | resource |
| [oci_identity_domain.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_domain) | resource |
| [oci_identity_domain_replication_to_region.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_domain_replication_to_region) | resource |
| [oci_identity_dynamic_group.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_dynamic_group) | resource |
| [oci_identity_group.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_group) | resource |
| [oci_identity_identity_provider.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_identity_provider) | resource |
| [oci_identity_idp_group_mapping.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_idp_group_mapping) | resource |
| [oci_identity_import_standard_tags_management.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_import_standard_tags_management) | resource |
| [oci_identity_network_source.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_network_source) | resource |
| [oci_identity_policy.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_smtp_credential.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_smtp_credential) | resource |
| [oci_identity_tag.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_tag) | resource |
| [oci_identity_tag_default.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_tag_default) | resource |
| [oci_identity_tag_namespace.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_tag_namespace) | resource |
| [oci_identity_ui_password.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_ui_password) | resource |
| [oci_identity_user.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user) | resource |
| [oci_identity_user_capabilities_management.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user_capabilities_management) | resource |
| [oci_identity_user_group_membership.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user_group_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | n/a | <pre>list(object({<br>    id        = number<br>    key_value = string<br>    user_id   = any<br>  }))</pre> | `[]` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | n/a | <pre>list(object({<br>    id          = number<br>    user_id     = any<br>    description = string<br>  }))</pre> | `[]` | no |
| <a name="input_authentication_policy"></a> [authentication\_policy](#input\_authentication\_policy) | n/a | <pre>list(object({<br>    id          = number<br>    description = string<br>    user_id     = any<br>    network_policy = optional(list(object({<br>      network_source_ids = any<br>    })))<br>    password_policy = optional(list(object({<br>      is_lowercase_characters_required = optional(bool)<br>      is_numeric_characters_required   = optional(bool)<br>      is_special_characters_required   = optional(bool)<br>      is_uppercase_characters_required = optional(bool)<br>      is_username_containment_allowed  = optional(bool)<br>      minimum_password_length          = optional(number)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_compartment"></a> [compartment](#input\_compartment) | compartment\_id - (Required) (Updatable) The OCID of the parent compartment containing the compartment.<br>defined\_tags - (Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see Resource Tags. Example: {"Operations.CostCenter": "42"}<br>description - (Required) (Updatable) The description you assign to the compartment during creation. Does not have to be unique, and it's changeable.<br>freeform\_tags - (Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see Resource Tags. Example: {"Department": "Finance"}<br>name - (Required) (Updatable) The name you assign to the compartment during creation. The name must be unique across all compartments in the parent compartment. Avoid entering confidential information.<br>enable\_delete - (Optional) Defaults to false. If omitted or set to false the provider will implicitly import the compartment if there is a name collision, and will not actually delete the compartment on destroy or removal of the resource declaration. If set to true, the provider will throw an error on a name collision with another compartment, and will attempt to delete the compartment on destroy or removal of the resource declaration. | <pre>list(object({<br>    id             = number<br>    compartment_id = any<br>    defined_tags   = optional(map(string))<br>    description    = string<br>    freeform_tags  = optional(map(string))<br>    name           = string<br>    enable_delete  = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_customer_secret_key"></a> [customer\_secret\_key](#input\_customer\_secret\_key) | n/a | <pre>list(object({<br>    id           = number<br>    display_name = string<br>    user_id      = any<br>  }))</pre> | `[]` | no |
| <a name="input_db_credential"></a> [db\_credential](#input\_db\_credential) | n/a | <pre>list(object({<br>    id          = number<br>    description = string<br>    password    = string<br>    user_id     = string<br>  }))</pre> | `[]` | no |
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | <pre>list(object({<br>    id                        = number<br>    compartment_id            = any<br>    description               = string<br>    display_name              = string<br>    home_region               = string<br>    license_type              = string<br>    admin_email               = optional(string)<br>    admin_first_name          = optional(string)<br>    admin_last_name           = optional(string)<br>    admin_user_name           = optional(string)<br>    defined_tags              = optional(map(string))<br>    freeform_tags             = optional(map(string))<br>    is_hidden_on_login        = optional(bool)<br>    is_notification_bypassed  = optional(bool)<br>    is_primary_email_required = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_domain_replication_to_region"></a> [domain\_replication\_to\_region](#input\_domain\_replication\_to\_region) | n/a | <pre>list(object({<br>    id             = number<br>    domain_id      = any<br>    replica_region = string<br>  }))</pre> | `[]` | no |
| <a name="input_dynamic_group"></a> [dynamic\_group](#input\_dynamic\_group) | n/a | <pre>list(object({<br>    id             = number<br>    compartment_id = any<br>    description    = string<br>    matching_rule  = string<br>    name           = string<br>    defined_tags   = optional(map(string))<br>    freeform_tags  = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_group"></a> [group](#input\_group) | n/a | <pre>list(object({<br>    id             = number<br>    description    = string<br>    name           = string<br>    compartment_id = any<br>    freeform_tags  = optional(map(string))<br>    defined_tags   = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_identity_provider"></a> [identity\_provider](#input\_identity\_provider) | n/a | <pre>list(object({<br>    id                  = number<br>    compartment_id      = any<br>    description         = string<br>    metadata            = string<br>    metadata_url        = string<br>    name                = string<br>    product_type        = string<br>    protocol            = string<br>    defined_tags        = optional(map(string))<br>    freeform_attributes = optional(map(string))<br>    freeform_tags       = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_idp_group_mapping"></a> [idp\_group\_mapping](#input\_idp\_group\_mapping) | n/a | <pre>list(object({<br>    id                   = number<br>    group_id             = any<br>    identity_provider_id = any<br>    idp_group_name       = string<br>  }))</pre> | `[]` | no |
| <a name="input_import_standard_tags_management"></a> [import\_standard\_tags\_management](#input\_import\_standard\_tags\_management) | n/a | <pre>list(object({<br>    id                          = number<br>    compartment_id              = any<br>    standard_tag_namespace_name = string<br>  }))</pre> | `[]` | no |
| <a name="input_network_source"></a> [network\_source](#input\_network\_source) | n/a | <pre>list(object({<br>    id                 = number<br>    compartment_id     = any<br>    description        = string<br>    name               = string<br>    defined_tags       = optional(map(string))<br>    freeform_tags      = optional(map(string))<br>    public_source_list = optional(list(string))<br>    services           = optional(list(string))<br>    virtual_source_list = optional(list(object({<br>      ip_ranges = list(string)<br>      vcn_id    = string<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | n/a | <pre>list(object({<br>    id             = number<br>    compartment_id = any<br>    description    = string<br>    name           = string<br>    statements     = list(string)<br>    defined_tags   = optional(map(string))<br>    freeform_tags  = optional(map(string))<br>    version_date   = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_smtp_credential"></a> [smtp\_credential](#input\_smtp\_credential) | n/a | <pre>list(object({<br>    id          = number<br>    description = string<br>    user_id     = any<br>  }))</pre> | `[]` | no |
| <a name="input_tag"></a> [tag](#input\_tag) | n/a | <pre>list(object({<br>    id               = number<br>    description      = string<br>    name             = string<br>    tag_namespace_id = any<br>    defined_tags     = optional(map(string))<br>    freeform_tags    = optional(map(string))<br>    is_cost_tracking = optional(bool)<br>    is_retired       = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_tag_default"></a> [tag\_default](#input\_tag\_default) | n/a | <pre>list(object({<br>    id                = number<br>    compartment_id    = any<br>    tag_definition_id = any<br>    value             = string<br>    is_required       = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_tag_namespace"></a> [tag\_namespace](#input\_tag\_namespace) | n/a | <pre>list(object({<br>    id             = number<br>    compartment_id = any<br>    description    = string<br>    name           = string<br>    defined_tags   = optional(map(string))<br>    freeform_tags  = optional(map(string))<br>    is_retired     = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_ui_password"></a> [ui\_password](#input\_ui\_password) | n/a | <pre>list(object({<br>    id      = number<br>    user_id = any<br>  }))</pre> | `[]` | no |
| <a name="input_user"></a> [user](#input\_user) | n/a | <pre>list(object({<br>    id          = number<br>    description = string<br>    name        = string<br>  }))</pre> | `[]` | no |
| <a name="input_user_capabilities_management"></a> [user\_capabilities\_management](#input\_user\_capabilities\_management) | n/a | <pre>list(object({<br>    id                           = number<br>    user_id                      = any<br>    can_use_api_keys             = optional(bool)<br>    can_use_auth_tokens          = optional(bool)<br>    can_use_console_password     = optional(bool)<br>    can_use_customer_secret_keys = optional(bool)<br>    can_use_smtp_credentials     = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_user_group_membership"></a> [user\_group\_membership](#input\_user\_group\_membership) | n/a | <pre>list(object({<br>    id       = number<br>    group_id = any<br>    user_id  = any<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key_id"></a> [api\_key\_id](#output\_api\_key\_id) | n/a |
| <a name="output_api_key_user_id"></a> [api\_key\_user\_id](#output\_api\_key\_user\_id) | n/a |
| <a name="output_auth_token_id"></a> [auth\_token\_id](#output\_auth\_token\_id) | n/a |
| <a name="output_authentication_policy_id"></a> [authentication\_policy\_id](#output\_authentication\_policy\_id) | n/a |
| <a name="output_compartment_id"></a> [compartment\_id](#output\_compartment\_id) | n/a |
| <a name="output_customer_secret_key"></a> [customer\_secret\_key](#output\_customer\_secret\_key) | n/a |
| <a name="output_customer_secret_key_id"></a> [customer\_secret\_key\_id](#output\_customer\_secret\_key\_id) | n/a |
| <a name="output_db_credential_id"></a> [db\_credential\_id](#output\_db\_credential\_id) | n/a |
| <a name="output_db_credential_user_id"></a> [db\_credential\_user\_id](#output\_db\_credential\_user\_id) | n/a |
| <a name="output_domain_compartment_id"></a> [domain\_compartment\_id](#output\_domain\_compartment\_id) | n/a |
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | n/a |
| <a name="output_domain_replication_to_region_domain_id"></a> [domain\_replication\_to\_region\_domain\_id](#output\_domain\_replication\_to\_region\_domain\_id) | n/a |
| <a name="output_domain_replication_to_region_id"></a> [domain\_replication\_to\_region\_id](#output\_domain\_replication\_to\_region\_id) | n/a |
| <a name="output_dynamic_group_compartment_id"></a> [dynamic\_group\_compartment\_id](#output\_dynamic\_group\_compartment\_id) | n/a |
| <a name="output_dynamic_group_id"></a> [dynamic\_group\_id](#output\_dynamic\_group\_id) | n/a |
| <a name="output_group_compartment_id"></a> [group\_compartment\_id](#output\_group\_compartment\_id) | n/a |
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | n/a |
| <a name="output_id_group_name"></a> [id\_group\_name](#output\_id\_group\_name) | n/a |
| <a name="output_identity_provider_compartment_id"></a> [identity\_provider\_compartment\_id](#output\_identity\_provider\_compartment\_id) | n/a |
| <a name="output_identity_provider_id"></a> [identity\_provider\_id](#output\_identity\_provider\_id) | n/a |
| <a name="output_idp_group_mapping_id"></a> [idp\_group\_mapping\_id](#output\_idp\_group\_mapping\_id) | n/a |
| <a name="output_import_standard_tags_management_compartment_id"></a> [import\_standard\_tags\_management\_compartment\_id](#output\_import\_standard\_tags\_management\_compartment\_id) | n/a |
| <a name="output_import_standard_tags_management_id"></a> [import\_standard\_tags\_management\_id](#output\_import\_standard\_tags\_management\_id) | n/a |
| <a name="output_network_source_compartment_id"></a> [network\_source\_compartment\_id](#output\_network\_source\_compartment\_id) | n/a |
| <a name="output_network_source_id"></a> [network\_source\_id](#output\_network\_source\_id) | n/a |
| <a name="output_policy_compartment_id"></a> [policy\_compartment\_id](#output\_policy\_compartment\_id) | n/a |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
| <a name="output_smtp_credential_id"></a> [smtp\_credential\_id](#output\_smtp\_credential\_id) | n/a |
| <a name="output_smtp_credential_user_id"></a> [smtp\_credential\_user\_id](#output\_smtp\_credential\_user\_id) | n/a |
| <a name="output_tag_default_id"></a> [tag\_default\_id](#output\_tag\_default\_id) | n/a |
| <a name="output_tag_definition_id"></a> [tag\_definition\_id](#output\_tag\_definition\_id) | n/a |
| <a name="output_tag_id"></a> [tag\_id](#output\_tag\_id) | n/a |
| <a name="output_tag_name"></a> [tag\_name](#output\_tag\_name) | n/a |
| <a name="output_tag_namespace_id"></a> [tag\_namespace\_id](#output\_tag\_namespace\_id) | n/a |
| <a name="output_ui_password_id"></a> [ui\_password\_id](#output\_ui\_password\_id) | n/a |
| <a name="output_ui_password_user_id"></a> [ui\_password\_user\_id](#output\_ui\_password\_user\_id) | n/a |
| <a name="output_user_capabilities_management_id"></a> [user\_capabilities\_management\_id](#output\_user\_capabilities\_management\_id) | n/a |
| <a name="output_user_capabilities_management_user_id"></a> [user\_capabilities\_management\_user\_id](#output\_user\_capabilities\_management\_user\_id) | n/a |
| <a name="output_user_compartment_id"></a> [user\_compartment\_id](#output\_user\_compartment\_id) | n/a |
| <a name="output_user_group_membership_compartment_id"></a> [user\_group\_membership\_compartment\_id](#output\_user\_group\_membership\_compartment\_id) | n/a |
| <a name="output_user_group_membership_id"></a> [user\_group\_membership\_id](#output\_user\_group\_membership\_id) | n/a |
| <a name="output_user_group_membership_user_id"></a> [user\_group\_membership\_user\_id](#output\_user\_group\_membership\_user\_id) | n/a |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | n/a |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | n/a |
