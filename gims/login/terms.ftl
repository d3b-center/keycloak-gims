<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("termsTitle")}
    <#elseif section = "form">
    <div id="kc-terms-text">
        <div class="kc-terms-header">
            <h3>Terms & Conditions</h3>
            <div>Last Update Date: 7/22/20</div>
        </div>
        <div> 
            As a user of the Services you agree that you are 13 years of age or older and furthermore
            agree to the Terms and Conditions of Services defined herein and where applicable the terms
            defined by the
            <a href="https://osp.od.nih.gov/wp-content/uploads/Genomic_Data_User_Code_of_Conduct.pdf">
                NIH Genomic Data User Code of Conduct
            </a>
            . These terms include, but are not limited to:
        </div>
        <div>
            <ol>
                <li>You will request controlled-access datasets solely in connection with the research project described in an approved Data Access Request for each dataset;</li>
                <li>You will make no attempt to identify or contact individual participants or groups from whom data were collected, or generate information that could allow participants’ identities to be readily ascertained;</li>
                <li>You will not distribute controlled-access datasets to any entity or individual beyond those specified in an approved Data Access Request;</li>
                <li>You will adhere to computer security practices in compliance with
                <a
                    href="https://osp.od.nih.gov/wp-content/uploads/NIH_Best_Practices_for_Controlled-Access_Data_Subject_to_the_NIH_GDS_Policy.pdf"
                >
                    NIH Security Best Practices for Controlled-Access Data
                </a>
                such that only authorized individuals possess access to data files;</li>
                <li>You acknowledge Intellectual Property Policies should they exist as specified in a dataset’s associated Data Use Certification; and,</li>
                <li>You will report any inadvertent data release in accordance with the terms in the Data Use Certification, breach of data security, or other data management incidents contrary to the terms of data access.</li>
            </ol>
        </div>
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">
        <div class="kc-terms-buttons-wrapper">
            <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" id="kc-decline" type="submit" value="${msg("doDecline")}"/>
            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="accept" id="kc-accept" type="submit" value="${msg("doAccept")}"/>
        </div>
    </form>
    <div class="clearfix"></div>
    </#if>
</@layout.registrationLayout>
