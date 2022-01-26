resource "keycloak_group" "investigator" {
  realm_id = var.realm_id
  name     = "kf-investigator"
}

resource "keycloak_group" "stakeholder" {
  realm_id = var.realm_id
  name     = "kf-stakeholder"
}