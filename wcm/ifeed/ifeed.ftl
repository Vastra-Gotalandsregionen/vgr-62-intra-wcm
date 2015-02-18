<#assign namespace = request["portlet-namespace"]>

<div class="ifeed-parsed-wrap intra-list-wrap content-box">


	<#if heading.data != "">
		<h2>
			${heading.data}
		</h2>
	</#if>

	<div class="content-box-bd">

		<#if content.data != "">
			<div class="description">
				${content.data}
			</div>
		</#if>

		<#list feedUrl.siblings as feed>

			<div class="ifeed-parsed-container" data-url="${feed.data}" data-displaytype="${feed.feedTitle.displayType.data}">
				<#if feed.feedTitle.data != "">
					<h3 class="ifeed-parsed-title">
						<span>${feed.feedTitle.data}</span>
					</h3>
				</#if>
				<div id="${namespace}feedContainer${feed_index}" class="ifeed-parsed-content intra-list-content"></div>
			</div>
		</#list>



	</div>

</div>


<#-- Template for results data -->
<script id="${namespace}feedTemplate" type="text/x-handlebars-template">
	<ul>
		{{#each this}}
			{{#ifCond format '==' 'application/pdf' }}
			<li class="pdf">
			{{else}}
			<li class="file">
			{{/ifCond}}

				<a href="{{url}}" target="_BLANK">
					{{title}}
				</a>
			</li>
		{{/each}}
	</ul>
</script>



<#-- Logic for pulling data from json service, parsing and adding content to DOM -->
<script>

	AUI().ready('aui-base', 'ifeed-consumer', function(A) {

		var namespace = '${namespace}';
		var feedContainers = A.all('#p_p_id' + namespace + " .ifeed-parsed-container");
		var templateNode = A.one('#' + namespace + 'feedTemplate');

		var ifeedConsumer = new A.IfeedConsumer({
			feedContainers: feedContainers,
			namespace: namespace,
			templateNode: templateNode
		});

	});

</script>
