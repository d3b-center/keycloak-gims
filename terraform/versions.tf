terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "= 3.0.1"
    }
  }
}

provider "keycloak" {
  client_id     = var.terraform_client_id
  client_secret = var.terraform_client_secret
  url           = var.keycloak_endpoint
  tls_insecure_skip_verify      = true
}

module "kf_strides" {
  count                                     = var.project_name == "kidsfirst" ? 1 : 0 // Include this module only for project Kidsfirst
  source                                    = "./modules/kf-strides"
  realm_id                                  = keycloak_realm.project_realm.id
  zeppelin_client_secret                    = var.zeppelin_client_secret
  kidsfirst_confidential_apis_client_secret = var.kidsfirst_confidential_apis_client_secret
  zeppelin_valid_redirect_uris              = var.zeppelin_valid_redirect_uris

  depends_on = [
    keycloak_realm.project_realm,
  ]
}
