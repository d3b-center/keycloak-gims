resource "keycloak_openid_client" "portal-ui" {
  realm_id                     = keycloak_realm.project_realm.id
  client_id                    = "portal-ui"
  name                         = ""
  description                  = ""
  enabled                      = true
  consent_required             = false
  access_type                  = "PUBLIC"
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = true
  root_url                     = ""
  valid_redirect_uris          = ["*"]
  base_url                     = "${var.portal_endpoint}/"
  admin_url                    = "${var.portal_endpoint}/"
  web_origins = [
    "https://localhost:3000",
    "${var.keycloak_endpoint}",
    "http://localhost:3000",
    "${var.portal_endpoint}"
  ]
  full_scope_allowed = true
}

resource "keycloak_openid_group_membership_protocol_mapper" "group" {
  realm_id  = keycloak_realm.project_realm.id
  client_id = keycloak_openid_client.portal-ui.id
  name      = "group"

  claim_name          = "groups"
  full_path           = false
  add_to_id_token     = false
  add_to_access_token = true
  add_to_userinfo     = false
}

resource "keycloak_openid_user_attribute_protocol_mapper" "custom-sub" {
  realm_id  = keycloak_realm.project_realm.id
  client_id = keycloak_openid_client.portal-ui.id
  name      = "custom-sub"

  user_attribute       = "externalUserId"
  claim_name           = "sub"
  claim_value_type     = "String"
  add_to_id_token      = true
  add_to_access_token  = true
  add_to_userinfo      = true
  multivalued          = false
  aggregate_attributes = false
}

resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider" {
  realm_id  = keycloak_realm.project_realm.id
  client_id = keycloak_openid_client.portal-ui.id
  name      = "identity_provider"

  claim_name       = "identity_provider"
  claim_value_type = "String"
  session_note     = "identity_provider"
}

resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider_identity" {
  realm_id  = keycloak_realm.project_realm.id
  client_id = keycloak_openid_client.portal-ui.id
  name      = "identity_provider_identity"

  claim_name       = "identity_provider_identity"
  claim_value_type = "String"
  session_note     = "identity_provider_identity"
}

resource "keycloak_openid_client" "apis" {
  realm_id         = keycloak_realm.project_realm.id
  client_id        = "${var.project_name}-apis"
  name             = ""
  description      = ""
  enabled          = true
  consent_required = false
  access_type      = "BEARER-ONLY"
}
