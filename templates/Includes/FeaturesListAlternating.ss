<div class="grid-x grid-padding-x feature alternating<% if $Last %> last<% end_if %>">
    <% if $Image %>
    <div class="medium-4 <% if $Odd %>medium-order-2<% end_if %> cell">
        <img src="$Image.URL" class="img-fluid" alt="<% if $Image.Title %>$Image.Title.ATT<% else %>$Title.ATT<% end_if %>">
    </div>
    <% end_if %>

    <% if $Image %>
    <div class="medium-8 <% if $Odd %>medium-order-1<% end_if %> cell">
    <% else %>
    <div class="small-12 cell">
    <% end_if %>
        <% if $Title %><div class='feature__title'><h3>$Title</h3></div><% end_if %>
        <% if $Content %>
            <div class='feature__content'>$Content</div>
        <% end_if %>

        <% if $ElementLink %>$ElementLink<% end_if %>
    </div>
</div>
