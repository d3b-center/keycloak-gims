resource "keycloak_realm" "project_realm" {
  #general
  realm               = var.project_realm_name
  display_name        = var.project_display_name
  enabled             = true
  user_managed_access = false

  #login
  registration_allowed     = false
  edit_username_allowed    = false
  reset_password_allowed   = false
  remember_me              = false
  verify_email             = false
  login_with_email_allowed = true
  duplicate_emails_allowed = false
  ssl_required             = "external"

  #Themes
  login_theme   = var.project_name
  account_theme = var.project_name
  admin_theme   = "keycloak"
  email_theme   = "keycloak"
  internationalization {
    supported_locales = [
      "en",
    ]
    default_locale = "en"
  }

  #Tokens
  revoke_refresh_token                     = false
  sso_session_idle_timeout                 = "30m"
  sso_session_max_lifespan                 = "10h"
  offline_session_idle_timeout             = "720h"
  offline_session_max_lifespan_enabled     = false
  access_token_lifespan                    = "30m"
  access_token_lifespan_for_implicit_flow  = "3h"
  access_code_lifespan                     = "1m"  #aka client login timeout
  access_code_lifespan_login               = "30m" #aka login timeout
  access_code_lifespan_user_action         = "5m"  #aka Login action timeout
  action_token_generated_by_user_lifespan  = "5m"  #aka User-Initiated Action Lifespan
  action_token_generated_by_admin_lifespan = "12h" #aka Default Admin-Initiated Action Lifespan

  security_defenses {
    headers {
      x_frame_options                     = "SAMEORIGIN"
      content_security_policy             = "frame-src 'self'; frame-ancestors 'self'; object-src 'none';"
      content_security_policy_report_only = ""
      x_content_type_options              = "nosniff"
      x_robots_tag                        = "none"
      x_xss_protection                    = "1; mode=block"
      strict_transport_security           = "max-age=31536000; includeSubDomains"
    }

    brute_force_detection {
      permanent_lockout                = false
      max_login_failures               = 30
      wait_increment_seconds           = 60
      quick_login_check_milli_seconds  = 1000
      minimum_quick_login_wait_seconds = 60
      max_failure_wait_seconds         = 900
      failure_reset_time_seconds       = 43200
    }
  }
}