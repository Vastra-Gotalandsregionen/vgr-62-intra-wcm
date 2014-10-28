<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") >
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") >


<#-- Get Parent Layout -->
<#assign parentPageData = parentPage.data?split("@") />

<#assign parentLayoutId =  getterUtil.getLong(parentPageData[0]) />

<#assign parentLayoutIsPrivate =  false />
<#if parentPageData[1] == "private">
	<#assign parentLayoutIsPrivate = true />
</#if>

<#assign parentLayoutGroupId = getterUtil.getLong(parentPageData[2]) />

<#assign parentLayout = layoutLocalService.getLayout(parentLayoutGroupId, parentLayoutIsPrivate, parentLayoutId) >

<#-- Get Child Layouts -->
<#assign childLayouts = layoutLocalService.getLayouts(parentLayout.groupId, parentLayout.isPrivateLayout(), parentLayout.layoutId) />

<#if childLayouts?has_content>
	<nav role="navigation" class="block-navigation">
		<ul class="level-1">
			<#list childLayouts as childLayout>
				<#assign subChildLayouts = layoutLocalService.getLayouts(childLayout.groupId, childLayout.isPrivateLayout(), childLayout.layoutId) />
				<li>
					<div class="level-1-content">
						<a href="${childLayout.friendlyURL}">
							${childLayout.getName(locale) }
						</a>
						<#if subChildLayouts?has_content>
							<ul class="level-2">
								<#list subChildLayouts as subChildLayout>
									<li>
										<a href="${subChildLayout.friendlyURL}">
											${subChildLayout.getName(locale) }
										</a>
									</li>
								</#list>
							</ul>
						</#if>
					</div>
				</li>
			</#list>
		</ul>
	</nav
</#if>
