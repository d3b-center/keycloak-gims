variable "project_realm_name" {
  description = "Project realm name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "project_display_name" {
  description = "Project display name"
  type        = string
}

variable "keycloak_endpoint" {
  description = "Keycloak endpoint"
  type        = string
}

variable "portal_endpoint" {
  description = "Portal endpoint"
  type        = string
}

variable "terraform_client_id" {
  description = "Client id for terraform client"
  type        = string
}

variable "terraform_client_secret" {
  description = "Client secret for terraform client"
  type        = string
}

variable "kidsfirst_confidential_apis_client_secret" {
  description = "Client secret for kidsfirst-confidential-apis client"
  type        = string
}

variable "zeppelin_client_secret" {
  description = "Client secret for zeppelin client"
  type        = string
}

variable "zeppelin_valid_redirect_uris" {
  type    = list(string)
  default = []
}

variable "orcid_endpoint" {
  description = "ORCID endpoint"
  type        = string
}

variable "orcid_client_id" {
  description = "Client id for orcid provider"
  type        = string
}

variable "orcid_client_secret" {
  description = "Secret for orcid provider"
  type        = string
}

variable "ras_authorize_endpoint" {
  description = "RAS authorize endpoint"
  type        = string
}

variable "ras_token_endpoint" {
  description = "RAS token endpoint"
  type        = string
}

variable "ras_userinfo_endpoint" {
  description = "RAS userinfo endpoint"
  type        = string
}

variable "ras_scopes" {
  description = "RAS scopes"
  type        = string
}

variable "ras_client_id" {
  description = "Client id for ras provider"
  type        = string
}

variable "ras_client_secret" {
  description = "Secret for ras provider"
  type        = string
}

variable "google_client_id" {
  description = "Client id for Google provider"
  type        = string
}

variable "google_client_secret" {
  description = "Secret for Google provider"
  type        = string
}

variable "facebook_endpoint" {
  description = "Facebook endpoint"
  type        = string
}

variable "facebook_client_id" {
  description = "Client id for Facebook provider"
  type        = string
}

variable "facebook_client_secret" {
  description = "Secret for Facebook provider"
  type        = string
}
