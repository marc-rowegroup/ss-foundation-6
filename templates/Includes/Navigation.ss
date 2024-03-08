<%-- <% cached 'navigation', $List('SiteTree').max('LastEdited'), $List('SiteTree').count() %> --%>
	<div class="navigation show-for-large-up" style="background-color: #$SiteConfig.NavBg;">
		<div class="mainmenu" role="nav">
			<ul>
				<% loop Menu(1) %>
				<li class="$URLSegment $FirstLast">
					<% if VoidLink = 1 %>
					<a href="javascript:void(0)">
						$MenuTitle <i class="fa-solid fa-caret-down"></i>
					</a>
					<% else_if Children %>
					<a href="$Link" <% if NewWindow = 1 %>target="_blank" <% if IsOutsideLink %> rel="noreferrer noopener"<% end_if %><% end_if %>>
						$MenuTitle <i class="fa-solid fa-caret-down"></i>
					</a>
					<% else %>
					<a href="$Link" <% if NewWindow = 1 %>target="_blank" <% if IsOutsideLink %> rel="noreferrer noopener"<% end_if %><% end_if %>>$MenuTitle</a>
					<% end_if %>
					<% if Children %>
					<ul class="$URLSegment">
						<% loop Children %>
						<li class="$URLSegment $LinkingMode $FirstLast">
							<% if VoidLink = 1 %>
							<a href="javascript:void(0)" <% if NewWindow = 1 %>target="_blank" <% if IsOutsideLink %> rel="noreferrer noopener"<% end_if %><% end_if %>>$MenuTitle</a>
							<% else %>
							<a href="$Link" <% if NewWindow = 1 %>target="_blank" <% if IsOutsideLink %> rel="noreferrer noopener"<% end_if %><% end_if %>>$MenuTitle</a>
							<% end_if %>
							<% if Children %>
							<ul>
								<% loop Children %>
								<li class="$LinkingMode $FirstLast">
									<a href="$Link" <% if NewWindow = 1 %>target="_blank" <% if IsOutsideLink %> rel="noreferrer noopener"<% end_if %><% end_if %>>$MenuTitle</a>
								</li>
								<% end_loop %>
							</ul>
							<% end_if %>
						</li>
						<% end_loop %>
					</ul>
					<% end_if %>
				</li>
				<% end_loop %>
			</ul>
		</div>
	</div>
	<%-- <% end_cached %> --%>