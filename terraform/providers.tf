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
