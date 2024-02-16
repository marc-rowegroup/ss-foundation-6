
<div class="title-bar text-center medium-text-left large-text-left" <% if $Banner %> style="background-image:url($Banner.URL);background-size:cover;background-attachment: fixed;"<% end_if %>>
<div class="<% if $Banner %> dark-overlay <% end_if %>">
		<div class="grid-container">
			<div class="grid-x">
				<div class="cell large-8 align-self-middle title-content">
					<h1>$Title</h1>
					<% include Breadcrumbs %>
				</div>
			</div>
		</div>
	</div>
</div>

