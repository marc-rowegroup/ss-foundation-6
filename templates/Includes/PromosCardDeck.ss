<div class="grid-x grid-padding-x small-up-2 <% if $WidthVariant == "large-12 cell" %>medium-up-4<% else %> medium-up-3<% end_if %>">
    <% loop $PromoList %>
        <div class="cell">
            <div class="card">
                <% if $Image %>
                    <img src="$Image.URL" class="promo__image card-img-top" alt="<% if $Image.Title %>$Image.Title.ATT<% else %>$Title.ATT<% end_if %>">
                <% end_if %>
                <div class="card-section">
                    <% if $Title && $ShowTitle %><h3 class="card-title">$Title</h3><% end_if %>
                    <% if $Content %><div class='card-text'>$Content.FirstSentence ... Learn More</div><% end_if %>
                    <% if $ElementLink.LinkURL %><a href="$ElementLink.LinkURL" title="Go to $Title.ATT" class="button">$ElementLink.Title</a><% end_if %>
                </div>
            </div>
        </div>
    <% end_loop %>
</div>
