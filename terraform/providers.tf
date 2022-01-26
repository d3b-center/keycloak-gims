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

resource "keycloak_oidc_identity_provider" "facebook" {
  realm                         = keycloak_realm.project_realm.id
  enabled                       = false
  alias                         = "facebook"
  provider_id                   = "facebook"
  authorization_url             = "${var.facebook_endpoint}/oauth/authorize"
  client_id                     = var.facebook_client_id
  client_secret                 = var.facebook_client_secret
  token_url                     = "${var.facebook_endpoint}/oauth/access_token"
  store_token                   = false
  backchannel_supported         = false
  first_broker_login_flow_alias = keycloak_authentication_flow.portal_first_broker_login.alias
  sync_mode                     = "IMPORT"
  user_info_url                 = "${var.facebook_endpoint}/me?fields=id,name,email,first_name,last_name"
  default_scopes                = "email name openid"
  gui_order                     = 2
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}

resource "keycloak_oidc_identity_provider" "orcid" {
  realm                         = keycloak_realm.project_realm.id
  alias                         = "orcid"
  display_name                  = "ORCID"
  authorization_url             = "${var.orcid_endpoint}/authorize"
  client_id                     = var.orcid_client_id
  client_secret                 = var.orcid_client_secret
  token_url                     = "${var.orcid_endpoint}/token"
  store_token                   = false
  backchannel_supported         = false
  first_broker_login_flow_alias = keycloak_authentication_flow.portal_first_broker_login.alias
  sync_mode                     = "IMPORT"
  gui_order                     = 3
  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
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