<div class="grid-container <% if PageLayout=0 %>full<% end_if %> main typography" role="main">
<div class="grid-x grid-padding-x grid-padding-y align-middle">	
	<div class="cell">
		$Content
	</div>
</div>
</div>
<% if HideChildren = 1 %>
	<% else_if Children %>
	<div class="grid-container">
		<%-- <div class="grid-x grid-padding-x small-up-2 medium-up-4 large-up-4">
			<% loop Children %>	
				<div class="cell <% loop Top.Level(1) %>$URLSegment<% end_loop %> small-text-center medium-text-center large-text-center">
					<div class="card">
						<% if Photo %><a class="" href="$Link" title="$Title" <% if NewWindow = 1 %>target="_blank"<% end_if %>>$Photo</a>
						<h4 class=""><a class="" href="$Link" title="$Title" <% if NewWindow = 1 %>target="_blank"<% end_if %>>$MenuTitle</a></h4>
						<% else %>					
						<h4 class="callout"><a class="" href="$Link" title="$Title" <% if NewWindow = 1 %>target="_blank"<% end_if %>>$MenuTitle</a></h4>
						<% end_if %>
					</div>
				</div>
			<% end_loop %>
		</div> --%>
		<div class="grid-x grid-padding-x grid-padding-y">
			<div class="cell">
				<ul class="menu align-center <% loop Top.Level(1) %>$URLSegment<% end_loop %>">
						<% loop Children %>	
						<li >
							<a class="" href="$Link" title="$Title" <% if NewWindow = 1 %>target="_blank"<% end_if %>>$MenuTitle</a>	
						</li>
					<% end_loop %>
				</ul>
			</div>
		</div>
	</div>
	<% end_if %>	