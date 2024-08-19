## COMPARTMENT ##

output "compartment_id" {
  value = try(
    oci_identity_compartment.this.*.id
  )
}

## API KEY ##

output "api_key_id" {
  value = try(
    oci_identity_api_key.this.*.id
  )
}

output "api_key_user_id" {
  value = try(
    oci_identity_api_key.this.*.user_id
  )
}

## AUTHENTICATION POLICY ##

output "authentication_policy_id" {
  value = try(
    oci_identity_authentication_policy.this.*.id
  )
}

## AUTH TOKEN ##

output "auth_token_id" {
  value = try(
    oci_identity_auth_token.this.*.id
  )
}

## CUSTOMER SECRET KEY ##

output "customer_secret_key_id" {
  value = try(
    oci_identity_customer_secret_key.this.*.id
  )
}

output "customer_secret_key" {
  value = try(
    oci_identity_customer_secret_key.this.*.key
  )
}

## DB CREDENTIAL ##

output "db_credential_id" {
  value = try(
    oci_identity_db_credential.this.*.id
  )
}

output "db_credential_user_id" {
  value = try(
    oci_identity_db_credential.this.*.user_id
  )
}

## DOMAIN ##

output "domain_id" {
  value = try(
    oci_identity_domain.this.*.id
  )
}

output "domain_compartment_id" {
  value = try(
    oci_identity_domain.this.*.compartment_id
  )
}

## DOMAIN REPLICATION TO REGION ##

output "domain_replication_to_region_id" {
  value = try(
    oci_identity_domain_replication_to_region.this.*.id
  )
}

output "domain_replication_to_region_domain_id" {
  value = try(
    oci_identity_domain_replication_to_region.this.*.domain_id
  )
}

## DYNAMIC GROUP ##

output "dynamic_group_id" {
  value = try(
    oci_identity_dynamic_group.this.*.id
  )
}

output "dynamic_group_compartment_id" {
  value = try(
    oci_identity_dynamic_group.this.*.compartment_id
  )
}

## GROUP ##

output "group_id" {
  value = try(
    oci_identity_group.this.*.id
  )
}

output "group_compartment_id" {
  value = try(
    oci_identity_group.this.*.compartment_id
  )
}

## IDENTITY PROVIDER ##

output "identity_provider_id" {
  value = try(
    oci_identity_identity_provider.this.*.id
  )
}

output "identity_provider_compartment_id" {
  value = try(
    oci_identity_identity_provider.this.*.compartment_id
  )
}

## IDP GROUP MAPPING ##

output "idp_group_mapping_id" {
  value = try(
    oci_identity_idp_group_mapping.this.*.id
  )
}

output "id_group_name" {
  value = try(
    oci_identity_idp_group_mapping.this.*.idp_group_name
  )
}

## IMPORT STANDARD TAGS MANAGEMENT ##

output "import_standard_tags_management_id" {
  value = try(
    oci_identity_import_standard_tags_management.this.*.id
  )
}

output "import_standard_tags_management_compartment_id" {
  value = try(
    oci_identity_import_standard_tags_management.this.*.compartment_id
  )
}

## NETWORK SOURCE ##

output "network_source_id" {
  value = try(
    oci_identity_network_source.this.*.id
  )
}

output "network_source_compartment_id" {
  value = try(
    oci_identity_network_source.this.*.compartment_id
  )
}

## POLICY ##

output "policy_id" {
  value = try(
    oci_identity_policy.this.*.id
  )
}

output "policy_compartment_id" {
  value = try(
    oci_identity_policy.this.*.compartment_id
  )
}

## SMTP CREDENTIALS ##

output "smtp_credential_id" {
  value = try(
    oci_identity_smtp_credential.this.*.id
  )
}

output "smtp_credential_user_id" {
  value = try(
    oci_identity_smtp_credential.this.*.user_id
  )
}

## TAG ##

output "tag_id" {
  value = try(
    oci_identity_tag.this.*.id
  )
}

output "tag_name" {
  value = try(
    oci_identity_tag.this.*.name
  )
}

output "tag_default_id" {
  value = try(
    oci_identity_tag_default.this.*.id
  )
}

output "tag_definition_id" {
  value = try(
    oci_identity_tag_default.this.*.tag_definition_id
  )
}

output "tag_namespace_id" {
  value = try(
    oci_identity_tag_namespace.this.*.id
  )
}

## UI PASSWORD ##

output "ui_password_id" {
  value = try(
    oci_identity_ui_password.this.*.id
  )
}

output "ui_password_user_id" {
  value = try(
    oci_identity_ui_password.this.*.user_id
  )
}

## USER ##

output "user_id" {
  value = try(
    oci_identity_user.this.*.id
  )
}

output "user_name" {
  value = try(
    oci_identity_user.this.*.name
  )
}

output "user_compartment_id" {
  value = try(
    oci_identity_user.this.*.compartment_id
  )
}

## USER CAPABILITIES MANAGEMENT ##

output "user_capabilities_management_id" {
  value = try(
    oci_identity_user_capabilities_management.this.*.id
  )
}

output "user_capabilities_management_user_id" {
  value = try(
    oci_identity_user_capabilities_management.this.*.user_id
  )
}

## USER GROUP MEMBERSHIP ##

output "user_group_membership_id" {
  value = try(
    oci_identity_user_group_membership.this.*.id
  )
}

output "user_group_membership_user_id" {
  value = try(
    oci_identity_user_group_membership.this.*.user_id
  )
}

output "user_group_membership_compartment_id" {
  value = try(
    oci_identity_user_group_membership.this.*.compartment_id
  )
}