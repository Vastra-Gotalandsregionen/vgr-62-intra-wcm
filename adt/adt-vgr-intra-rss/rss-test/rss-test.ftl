<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<div class="content-box">

	<h2>${feedTitle}</h2>

	<div class="content-box-bd">
    <#list entries as entry>
      <div>
        <a href="${entry.link}" target="_BLANK">
          ${entry.title}
          <div>
            ${entry.publishedDate?string["dd MMM yyyy"]}
          </div>

        </a>
      </div>
    </#list>
	</div>

</div>
