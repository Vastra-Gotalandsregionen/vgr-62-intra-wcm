<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#assign assetEntryLocalService = serviceLocator.findService("com.liferay.portlet.asset.service.AssetEntryLocalService")>
<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.portlet.expando.service.ExpandoValueLocalService") />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.portlet.journal.service.JournalArticleLocalService")>
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#assign maxHeadingChars = 50 />

<#assign news_featured_article_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "vgr-intra-news-featured-article-id", group_id, "")  />

<#assign article = journalArticleLocalService.getLatestArticle(group_id, news_featured_article_id)! />

<#if article?has_content>

  <#assign entry = assetEntryLocalService.fetchEntry("com.liferay.portlet.journal.model.JournalArticle", article.getResourcePrimKey()) />
  <#assign assetRenderer = entry.getAssetRenderer() />

  <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />

  <#if assetLinkBehavior != "showFullContent">
    <#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
  </#if>

  <#assign docXml = saxReaderUtil.read(article.getContentByLocale(locale)) />

  <#assign itemHeading = docXml.valueOf("//dynamic-element[@name='heading']/dynamic-content/text()") />
  <#assign itemType = docXml.valueOf("//dynamic-element[@name='type']/dynamic-content/text()") />
  <#assign itemImage = docXml.valueOf("//dynamic-element[@name='featuredImage']/dynamic-content/text()") />

  <#assign imageCssClass = itemType />

  <#if !itemImage?has_content>
    <#-- Src below is a transparent gif -->
    <#assign itemImage = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" />
    <#assign imageCssClass = imageCssClass + " transparent" />
  </#if>

  <a class="news-featured" href="${viewURL}">
    <img src="${itemImage}" alt="${itemHeading}" class="${imageCssClass}" />
    <h3>
      <span>
        ${ellipsis(itemHeading, maxHeadingChars)}
      </span>
    </h3>
  </a>
<#else>
  <div class="portlet-msg-info">
    Du har inte satt n&aring;gon artikel som featured. Uppdatera "egna f&auml;ltet" som heter "Vgr Intra News Featured Article Id" med ett artikel-id.
  </div>
</#if>


<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
	<#else>
		<#return myString />
	</#if>
</#function>
