<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.portlet.expando.service.ExpandoValueLocalService") />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.portlet.journal.service.JournalArticleLocalService")>
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#assign maxItemsToDisplay = 6 />

<#assign maxHeadingChars = 40 />
<#assign maxSummaryChars = 120 />

<#assign news_featured_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-news-featured-article-id", group_id, "")  />

<#assign news_featured_article = journalArticleLocalService.getLatestArticle(group_id, news_featured_article_id)! />


<div class="news-box">

  <h1>
    Nyheter
  </h1>

  <#if entries?has_content>

    <div class="news-items">
      <#assign rendered_items = 0 />
      <#list entries as entry>

        <#if rendered_items gte maxItemsToDisplay>
          <#break>
        </#if>

        <#-- Do not display featured article -->

        <#assign display_entry = true />
        <#if news_featured_article?has_content>
          <#if entry.classPK = news_featured_article.resourcePrimKey>
            <#assign display_entry = false />
          </#if>
        </#if>

        <#if display_entry>

  				<#assign assetRenderer = entry.getAssetRenderer() />
  				<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />

  				<#if assetLinkBehavior != "showFullContent">
  					<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
  				</#if>

          <#assign article = assetRenderer.getArticle() />
          <#assign docXml = saxReaderUtil.read(article.getContentByLocale(locale)) />
          <#assign itemHeading = docXml.valueOf("//dynamic-element[@name='heading']/dynamic-content/text()") />
          <#assign itemSummary = docXml.valueOf("//dynamic-element[@name='summary']/dynamic-content/text()") />
          <#assign itemContent = docXml.valueOf("//dynamic-element[@name='content']/dynamic-content/text()") />
          <#assign itemDate = docXml.valueOf("//dynamic-element[@name='date']/dynamic-content/text()") />

          <#assign itemContent = htmlUtil.stripHtml(itemContent) />
          <#if !itemSummary?has_content>
            <#assign itemSummary = itemContent />
          </#if>

          <#assign itemDate = itemDate?number?long?number_to_datetime?string("yyyy-MM-dd")>

          <#assign itemType = docXml.valueOf("//dynamic-element[@name='type']/dynamic-content/text()") />

          <div class="news-item news-item-${itemType}">
            <a href="${viewURL}">
              <div class="news-item-inner">
                <div class="news-item-date">
                  ${itemDate}
                </div>
                <div class="news-item-heading">
                    ${ellipsis(itemHeading, maxHeadingChars)}
                </div>
                <div class="news-item-summary">
                  ${ellipsis(itemSummary, maxSummaryChars)}
                </div>
              </div>
            </a>
          </div>

          <#assign rendered_items = rendered_items + 1 />
        </#if>

      </#list>

    </div>

    <#assign entry = entries[0] />
    <#assign article = entry.getAssetRenderer().getArticle() />
    <#assign displayPageUuid = article.getLayoutUuid() />
    <#assign displayPage = layoutLocalService.fetchLayoutByUuidAndGroupId(displayPageUuid, group_id, page.isPrivateLayout())! />
    <#if displayPage?has_content>
      <#assign displayPageUrl = displayPage.getFriendlyURL(locale) />
      <a href="${displayPageUrl}" class="more-link">Fler nyheter &raquo;</a>
    </#if>

  </#if>

</div>

<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
	<#else>
		<#return myString />
	</#if>
</#function>
