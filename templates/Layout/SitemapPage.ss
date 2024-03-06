<% require themedCSS(SitemapPage) %>
<% include RowWrap %>
<% include BuildLeftSidebar %>
	<main class="typography">	
		<h1 class="headline">$Title</h1>				
		$Content
		<% cached 'sitemap_page', $ID, List(Page).Max(LastEdited) %>
			<% if $Sitemap %>
				<div id="Sitemap">$Sitemap</div>
			<% end_if %>
		<% end_cached %>
		$Form
		$PageComments
	</main>
<% include BuildRightSidebar %>
<% include RowWrapEnd %>
