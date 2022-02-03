resource "keycloak_oidc_google_identity_provider" "google" {
  realm                         = keycloak_realm.project_realm.id
  client_id                     = var.google_client_id
  client_secret                 = var.google_client_secret
  trust_email                   = false
  store_token                   = false
  first_broker_login_flow_alias = keycloak_authentication_flow.portal_first_broker_login.alias
  sync_mode                     = "IMPORT"
  gui_order                     = 1
}

resource "keycloak_oidc_identity_provider" "ras" {
  realm                         = keycloak_realm.project_realm.id
  alias                         = "ras"
  display_name                  = "NIH Researcher Auth Service"
  authorization_url             = var.ras_authorize_endpoint
  client_id                     = var.ras_client_id
  client_secret                 = var.ras_client_secret
  token_url                     = var.ras_token_endpoint
  store_token                   = false
  backchannel_supported         = false
  first_broker_login_flow_alias = keycloak_authentication_flow.portal_first_broker_login.alias
  sync_mode                     = "IMPORT"
  user_info_url                 = var.ras_userinfo_endpoint
  default_scopes                = var.ras_scopes
  gui_order                     = 4
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
