<% if $Content %>
	<div class="grid-container <% if PageLayout=0 %>full<% end_if %>" role="main">
		<div class="grid-x grid-padding-x grid-padding-y align-middle">	
			<div class="cell">
				<div class="content-container main">
					$Content
				</div>
			</div>
		</div>
	</div>
<% end_if %>
<% include ChildGrid %>
