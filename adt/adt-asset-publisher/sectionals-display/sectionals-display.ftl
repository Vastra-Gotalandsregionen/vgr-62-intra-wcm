<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#--
<#assign portletCustomTitle = portletPreferences.getValue("portlet-setup-title-" + themeDisplay.getLanguageId(), themeDisplay.getPortletDisplay().getTitle()) />
-->





<div class="sectionals-listings-wrap">

  <h1>${themeDisplay.getPortletDisplay().getTitle()}</h1>

  <#if entries?has_content>
    <div class="staff-week-items">
      <ul class="">
        <#list entries as entry>

          <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
          <#assign entryHeading = docXml.valueOf("//dynamic-element[@name='heading']/dynamic-content/text()") />
          <#assign entryContent = docXml.valueOf("//dynamic-element[@name='content']/dynamic-content/text()") />

          <#assign sections = docXml.selectNodes("//dynamic-element[@name='sectionHeading']") />

          <#assign displaySections = sections?size gt 1 />
          <#if sections?size == 1>
            <#assign displaySections =  (sections[0].valueOf("dynamic-content/text()") != "" )/>
          </#if>

          <li>
            ${entryHeading}

            <#if displaySections>
              <ul>
                <#list sections as section>
                  <#assign sectionHeading = section.valueOf("dynamic-content/text()") />
                  <li>
                    ${sectionHeading}
                  </li>
                </#list>
              </ul>
            </#if>
          </li>

        </#list>
      </ul>

    </div>
  </#if>

</div>
