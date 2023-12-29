<div class="grid-container full header">
    <div id="header" class="grid-x align-middle">
        <div class="cell large-auto show-for-large text-center">
            <% if SiteConfig.SiteLogo %>
            <a href="/" class="" style="font-size:24px">
                $SiteConfig.SiteLogo
            </a>
            <% else %>
            <h1 class="show-for-large-up" style="font-size:32px;font-weight:700;padding:0;margin:0;">
                <a style="" href="{$baseUrl}">$SiteConfig.Title</a>
            </h1>
            <% end_if %>
        </div>
        <div class="cell large-9 small-12">
            <% include MegaMenu %>
        </div>
        <div class="cell large-auto show-for-large">
            <ul class="menu align-center">
                <% if SiteConfig.FacebookLink %>
                <li>
                    <a href="$SiteConfig.FacebookLink" target="_blank"><i class="fab fa-facebook-f"></i></a>
                </li>
                <% end_if %>
                <% if SiteConfig.TwitterLink %>
                <li>
                    <a href="$SiteConfig.TwitterLink" target="_blank"><i class="fab fa-twitter"></i> </a>
                </li>
                <% end_if %>
                <% if SiteConfig.InstagramLink %>
                <li>
                    <a href="$SiteConfig.InstagramLink" target="_blank"><i class="fab fa-instagram"></i></a>
                </li>
                <% end_if %>
                <% if SiteConfig.YouTubeLink %>
                <li>
                    <a href="$SiteConfig.YouTubeLink" target="_blank"><i class="fab fa-youtube"></i></a>
                </li>
                <% end_if %>
                <% if SiteConfig.LinkedinLink %>
                <li>
                    <a href="$SiteConfig.LinkedinLink" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                </li>
                <% end_if %>
            </ul>
        </div>
    </div>
</div>

<%-- <% include TopBar %> --%>
    