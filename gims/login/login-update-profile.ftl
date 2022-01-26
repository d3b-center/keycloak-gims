<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "header">
${msg("loginProfileTitle")}
<#elseif section = "form">
<form id="kc-update-profile-form" class="ui large form" action="${url.loginAction}" method="post">
  <#if user.editUsernameAllowed>
  <div class="field <#if usernameEditDisabled??>disabled</#if>">
    <label for="username">${msg("username")}</label>
    <div class="ui left icon input">
      <i class="user icon"></i>
      <input tabindex="0" required id="username" type="text" name="username" value="${(user.username!'')}" autofocus autocomplete="off">
    </div>
  </div>
  </#if>


  <div class="field">
    <label for="email">${msg("email")}</label>
    <div class="ui left icon input">
      <i class="mail icon"></i>
      <input tabindex="0" required id="email" type="text" name="email" value="${(user.email!'')}" autocomplete="off">
    </div>
  </div>

  <div class="field">
    <label for="firstName">${msg("firstName")}</label>
    <div class="ui left icon input">
      <i class="info icon"></i>
      <input tabindex="0" required id="firstName" type="text" name="firstName" value="${(user.firstName!'')}" autocomplete="off">
    </div>
  </div>

  <div class="field">
    <label for="lastName">${msg("lastName")}</label>
    <div class="ui left icon input">
      <i class="info icon"></i>
      <input tabindex="0" required id="lastName" type="text" name="lastName" value="${(user.lastName!'')}" autocomplete="off">
    </div>
  </div>

  <#if isAppInitiatedAction??>
  <input type="submit" value="${msg("doSubmit")}" />
  <button class="ui button" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
  <#else>
  <input class="ui large fluid primary button" type="submit" value="${msg("doSubmit")}" />
  </#if>
  </div>
</form>
</#if>
</@layout.registrationLayout>

