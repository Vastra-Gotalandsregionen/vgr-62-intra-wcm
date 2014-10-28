<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.portlet.expando.service.ExpandoValueLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#--
<#assign news_layout_friendly_url = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "news-page-friendly-url", group_id, "")  />
<#assign news_layout = layoutLocalService.fetchLayoutByFriendlyURL(group_id, page.isPrivateLayout(), news_layout_friendly_url)! />
-->

<#if entries?has_content>

  <h1>
    Nyheter
  </h1>

  <ul>
    <#list entries as entry>
      <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
      <#assign itemHeading = docXml.valueOf("//dynamic-element[@name='heading']/dynamic-content/text()") />
      <#assign itemSummary = docXml.valueOf("//dynamic-element[@name='summary']/dynamic-content/text()") />
      <#assign itemDate = docXml.valueOf("//dynamic-element[@name='date']/dynamic-content/text()") />
      <#assign itemDate = itemDate?number?long?number_to_datetime?string("yyyy-MMM-dd")>

      <li>
        ${itemDate} - ${itemHeading}
      </li>

    </#list>
  </ul>

</#if>
