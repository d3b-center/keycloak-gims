<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <link href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" rel="stylesheet">

    <#if properties.meta?has_content>
    <#list properties.meta?split(' ') as meta>
    <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
    <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
    </#list>
    </#if>
    <#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
    <#--
    <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    <script src="${url.resourcesPath}/${script}" type="module"></script>
    -->
    <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
    </#if>
    <#if scripts??>
    <#list scripts as script>
    <script src="${script}" type="text/javascript"></script>
    </#list>
    </#if>
  </head>

  <body class="${properties.kcBodyClass!}">
    <div class="smiling-girl">
    </div>
    <div class="content">
      <div class="column">
        <div class="logo-container">
          <a href="https://kidsfirstdrc.org/portal/">
            <img src="${url.resourcesPath}/img/kf-logo.svg" class="image">
          </a>
        </div>
        <div class="title">
          <a href="https://kidsfirstdrc.org/portal/">
            <h3>
                ${realm.displayNameHtml}
            </h3>
          </a>
        </div>
        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
        <div class="ui ${message.type} message">
          <#if message.type = 'success'><i class="${properties.kcFeedbackSuccessIcon!} icon"></i></#if>
          <#if message.type = 'warning'><i class="${properties.kcFeedbackWarningIcon!} icon"></i></#if>
          <#if message.type = 'error'><i class="${properties.kcFeedbackErrorIcon!} icon"></i></#if>
          <#if message.type = 'info'><i class="${properties.kcFeedbackInfoIcon!} icon"></i></#if>
          <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
        </div>
        </#if>

        <div class="ui stacked left aligned segment">
          <#nested "form">
          <#nested "info">
        </div>

      </div>
    </div>


  </body>
</html>
</#macro>

