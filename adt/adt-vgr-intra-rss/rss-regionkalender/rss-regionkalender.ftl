<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<div class="content-box content-box-simple">

	<div class="content-box-bd">
    <#list entries as entry>

			<div class="entry-item">
				<a href="${entry.link}" target="_blank">
					<div class="entry-date">
						<div class="entry-date-inner">
							<div class="entry-date-month">
								${entry.publishedDate?string["MMM"]}
							</div>
							<div class="entry-date-day">
								${entry.publishedDate?string["dd"]}
							</div>
						</div>
					</div>
					<div class="entry-content">
						${entry.title}
					</div>
				</a>
			</div>

    </#list>
	</div>

</div>
