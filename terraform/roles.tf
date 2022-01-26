resource "keycloak_role" "ADMIN" {
  realm_id    = keycloak_realm.project_realm.id
  name        = "ADMIN"
  description = "Admin"
}
