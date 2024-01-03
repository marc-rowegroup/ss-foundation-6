

<div <% if $Banner %> style="background-image:url($Banner.URL);background-size:cover;background-attachment: fixed;"<% else %>style="background:gainsboro;" <% end_if %>>
	<div class="grid-container full">
		<div class="grid-x">
			<div class="cell large-10 large-offset-1 align-self-middle">
				<h1 class="title-header">$Title</h1>
				<% include Breadcrumbs %>
			</div>
		</div>
	</div>
</div>

