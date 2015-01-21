<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<div class="contacts-listing content-box">

  <h2>
    Kontaktpersoner
  </h2>

  <div class="content-box-bd">

    <#if entries?has_content>
      <div class="news-items">
        <#list entries as entry>

          <#assign assetRenderer = entry.getAssetRenderer() />

          <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
          <#assign contactName = docXml.valueOf("//dynamic-element[@name='name']/dynamic-content/text()") />
          <#assign contactTitle = docXml.valueOf("//dynamic-element[@name='title']/dynamic-content/text()") />
          <#assign contactEmail = docXml.valueOf("//dynamic-element[@name='email']/dynamic-content/text()") />
          <#assign contactPhone = docXml.valueOf("//dynamic-element[@name='phone']/dynamic-content/text()") />

          <div class="contact">

            <div class="contact-name">
              ${contactName}
            </div>

            <#if contactTitle != "">
              <div class="contact-title">
                ${contactTitle}
              </div>
            </#if>

            <#if contactEmail != "">
              <div class="contact-email">
                <a href ="mailto:${contactEmail}">
                  ${contactEmail}
                </a>
              </div>
            </#if>

            <#if contactPhone != "">
              <div class="contact-phone">
                ${contactPhone}
              </div>
            </#if>

          </div>

        </#list>
      </div>
    </#if>

  </div>

</div>
