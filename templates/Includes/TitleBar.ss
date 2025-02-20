
<div class="title-bar text-center medium-text-left large-text-left" <% if $Banner %> style="background-image:url($Banner.URL);background-size:cover;background-attachment: fixed;"<% end_if %>>
	<div class="dark-overlay">
		<div class="grid-container">
			<div class="grid-x">
				<div class="cell large-8 align-self-middle">
					<h1>$Title</h1>
					<p>$CategoryBlurb</p>
					<% include Breadcrumbs %>
				</div>
			</div>
		</div>
	</div>
</div>

