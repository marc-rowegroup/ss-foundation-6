<div class="grid-x grid-padding-x feature<% if $Last %> last<% end_if %>">
    <% if $Image %>
        <div class="medium-4 cell">
            <img src="$Image.URL" class="img-fluid" alt="<% if $Image.Title %>$Image.Title.ATT<% else %>$Title.ATT<% end_if %>">
        </div>
    <% end_if %>

    <div class="medium<% if $Image %>-8<% else %>-12<% end_if %> cell">
        <% if $Title %><div class='feature__title'><h3>$Title</h3></div><% end_if %>
        <% if $Content %>
            <div class='feature__content'>$Content</div>
        <% end_if %>

        <% if $ElementLink %>$ElementLink<% end_if %>
    </div>
</div>
