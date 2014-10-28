<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") >
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") >

<div>${heading.data}</div>
<div>${date.data}</div>
<div>${summary.data}</div>
<div>${content.data}</div>
