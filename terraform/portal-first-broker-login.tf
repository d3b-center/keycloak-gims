resource "keycloak_authentication_flow" "portal_first_broker_login" {
  realm_id = keycloak_realm.project_realm.id
  alias    = "portal_first_broker_login"
}

resource "keycloak_authentication_execution" "alternative_1" {
  realm_id          = keycloak_realm.project_realm.id
  parent_flow_alias = keycloak_authentication_flow.portal_first_broker_login.alias
  authenticator     = "idp-create-user-if-unique"
  requirement       = "ALTERNATIVE"
}

resource "keycloak_authentication_execution" "alternative_2" {
  realm_id          = keycloak_realm.project_realm.id
  parent_flow_alias = keycloak_authentication_flow.portal_first_broker_login.alias
  authenticator     = "idp-auto-link"
  requirement       = "ALTERNATIVE"
  depends_on = [
    keycloak_authentication_execution.alternative_1
  ]
}
