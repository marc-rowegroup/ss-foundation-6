

	<div class="grid-container full" <% if $Banner %> style="background-image:url($Banner.URL);background-size:cover;background-attachment: fixed;"<% end_if %>>
		<div class="grid-x grid-padding-x grid-padding-y">
			<div class="cell large-10 large-offset-1 align-self-middle">
				<h1 class="title-header">$Title</h1>
				<% include Breadcrumbs %>
			</div>
		</div>
	</div>


