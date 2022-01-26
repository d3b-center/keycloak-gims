<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
<#if section = "header">
  ${msg("doLogIn")}
<#elseif section = "form">
  <div class="title">
    <h2>
        ${msg("loginWith")}
    </h2>
  </div>
  <div id="kc-social-providers" class="social-providers">
    <div class="ui list">
      <#list social.providers as p>
      <div class="item">
        <a href="${p.loginUrl}" id="zocial-${p.alias}" class="ui large fluid button zocial ${p.providerId}">
          <img src="${url.resourcesPath}/img/${p.alias}-icon.svg" class="social-icon" id="${p.alias}-icon"/>
          <span class="sr-only">Log in with </span>
          <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
        </a>
      </div>
      </#list>
    </div>
  </div>
<#elseif section = "info" >
<#if realm.password && realm.registrationAllowed && !registrationDisabled??>

<div id="kc-registration" class="registration-label-mdc">
  <span>${msg("noAccount")} <a tabindex="0" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
</div>
</#if>
</#if>

</@layout.registrationLayout>

