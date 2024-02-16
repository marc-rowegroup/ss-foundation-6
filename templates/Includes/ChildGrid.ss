
<% if HideChildren = 1 %>
<% else_if SubPages %>
        <div class="grid-container <% if PageLayout=0 %>full<% end_if %>">
            <div class="grid-x grid-padding-x grid-padding-y small-up-2 medium-up-4 large-up-4">
                <% loop SubPages %>	
                    <div class="cell <% loop Top.Level(1) %>$URLSegment<% end_loop %>">
                        <div class="card">
                            <% if Photo.ScaleWidth(300) %>
                            <a class="" href="$Link" <% if NewWindow = 1 %>target="_blank"<% end_if %>>
                                <img src="$Photo.URL" loading="lazy" alt="<% if $Image.Title %>$Image.Title.ATT<% else %>$Title.ATT<% end_if %>" title="<% if $Image.Title %>$Image.Title.ATT<% else %>$Title.ATT<% end_if %>">
                            </a>
                            <a class="card-title" href="$Link" title="$Title" <% if NewWindow = 1 %>target="_blank"<% end_if %>><h4>$MenuTitle</h4> <i class="fa-solid fa-arrow-right"></i></a>
                            <% else %>					
                            <a class="card-title" href="$Link" title="$Title" <% if NewWindow = 1 %>target="_blank"<% end_if %>><h4>$MenuTitle</h4> <i class="fa-solid fa-arrow-right"></i></a>
                            <% end_if %>
                        </div>
                    </div>
                <% end_loop %>
            </div>
        </div>
<% end_if %>	