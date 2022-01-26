variable "realm_id" {
  description = "realm id"
  type        = string
}

variable "zeppelin_client_secret" {
  description = "Client secret for zeppelin client"
  type        = string
}

variable "kidsfirst_confidential_apis_client_secret" {
  description = "Client secret for kidsfirst-confidential-apis client"
  type        = string
}

variable "zeppelin_valid_redirect_uris" {
  type    = list(string)
  default = []
}