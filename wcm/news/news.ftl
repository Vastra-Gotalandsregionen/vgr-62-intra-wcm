<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") >
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") >

<#assign newsDate = date.data?number?long?number_to_datetime?string("yyyy-MM-dd")>

<div class="news-item">
	<div class="news-date">${newsDate}</div>
	<h1>${heading.data}</h1>
	<div class="news-summary">${summary.data}</div>
	<div class="news-content">${content.data}</div>
</div>
