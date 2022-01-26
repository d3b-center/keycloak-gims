resource "keycloak_openid_client" "zeppelin" {
  realm_id              = var.realm_id
  client_id             = "zeppelin"
  client_secret         = var.zeppelin_client_secret
  standard_flow_enabled = true
  implicit_flow_enabled = false
  name                  = ""
  description           = ""
  enabled               = true
  consent_required      = false
  access_type           = "CONFIDENTIAL"
  valid_redirect_uris   = var.zeppelin_valid_redirect_uris
}
resource "keycloak_openid_user_attribute_protocol_mapper" "zeppelin-custom-sub" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.zeppelin.id
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

resource "keycloak_openid_client" "kidsfirst-confidential-apis" {
  realm_id                     = var.realm_id
  client_id                    = "kidsfirst-confidential-apis"
  client_secret                = var.kidsfirst_confidential_apis_client_secret
  standard_flow_enabled        = false
  implicit_flow_enabled        = false
  name                         = ""
  description                  = ""
  enabled                      = true
  consent_required             = false
  access_type                  = "CONFIDENTIAL"
  direct_access_grants_enabled = false
  service_accounts_enabled     = true
}