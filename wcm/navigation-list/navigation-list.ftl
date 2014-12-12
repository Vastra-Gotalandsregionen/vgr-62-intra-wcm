<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") >
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") >

<#if pages.siblings?has_content>
	<ul class="navigation-list">
		<#list pages.siblings as page>

			<#-- Get Page Layout -->
			<#assign pageData = page.data?split("@") />

			<#assign pageLayoutId =  getterUtil.getLong(pageData[0]) />

			<#assign pageLayoutIsPrivate =  false />
			<#if pageData[1] == "private">
				<#assign pageLayoutIsPrivate = true />
			</#if>

			<#assign pageLayoutGroupId = getterUtil.getLong(pageData[2]) />

			<#assign pageLayout = layoutLocalService.getLayout(pageLayoutGroupId, pageLayoutIsPrivate, pageLayoutId) >

			<li>
				<a href="${pageLayout.friendlyURL}">
					${pageLayout.getName(locale) }
				</a>
			</li>
		</#list>
	</ul>
</#if>
