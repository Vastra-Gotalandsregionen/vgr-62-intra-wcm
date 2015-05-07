<#setting locale=locale>


<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />



<#--
<div class="events">

	<#list entries as entry>

		<div class="event-item">

			<div class="event-date">
				<span class="start">
					<span class="day">10</span>
					<span class="month">apr</span>
				</span>

				<span class="sep">-</span>

				<span class="end">

					<span class="day">11</span>
					<span class="month">apr</span>
				</span>
			</div>

			<div class="event-info">
				<h3 class="event-title">Title</h3>
				<span class="event-info-time">
					<i class="icon-time"></i> (april 10) 12.00 - (april 10) 14.00
				</span>
				<span class="event-info-place">
					<i class="icon-map-marker"></i> Sporthallen
				</span>
			</div>

		</div>

	</#list>

</div>
-->


<div class="content-box content-box-simple content-box-wide">

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

						<h3>
							${entry.title}
						</h3>

						<#if entry.startDate?has_content || entry.endDate?has_content>
							<span class="time">
								<i class="icon-time"></i> (${entry.startDate!}) ${entry.startTime!} - (${entry.endDate!}) ${entry.endTime!}
							</span>
						</#if>

						<#if entry.location?has_content>
							<span class="place">
								<i class="icon-map-marker"></i> ${entry.location!}
							</span>
						</#if>

					</div>
				</a>
			</div>

    </#list>
	</div>

</div>
