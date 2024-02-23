<footer class="footer">
    <div class="grid-container">
        <div class="grid-x grid-padding-x grid-padding-y footer-content">
            <div class="cell large-6">
                <h3>Services</h3>
                <% loop $ChildrenOf('services') %>
                    <ul class="vertical menu">
                            <li><a href="$Link">$Title</a></li>
                    </ul>
                <% end_loop %>
            </div>
            <div class="cell large-6">
                    <h3>Quick Links</h3>
                    <% loop Menu(1) %>
                        <ul class="vertical menu">
                            <li><a href="$Link">$Title</a></li>
                        </ul>
                    <% end_loop %>
            </div>
        </div>
    </div>
    <div class="grid-container">
        <div class="grid-x grid-padding-x grid-padding-y align-middle">
            <div class="cell large-4">
                <% with $MenuSet('footer') %> 
                    <% cached 'YourMenuNameCacheKey', $LastEdited, $MenuItems.max('LastEdited'), $MenuItems.count %>
                        <% if $MenuItems %>
                            <ul class="menu">
                                <% loop $MenuSet('footer').MenuItems %>
                                    <li>
                                        <a href="{$Link}" class="{$LinkingMode}">{$Title}</a>
                                    </li>
                                <% end_loop %>
                            </ul>
                        <% end_if %>
                    <% end_cached %>
                <% end_with %>
            </div>
            <div class="cell large-4">
                <ul class="menu align-middle">
                    <% if SiteConfig.FacebookLink %>
                        <li>
                            <a href="$SiteConfig.FacebookLink" target="_blank"><i class="fa-brands fa-square-facebook"></i></a>
                        </li>
                        <% end_if %>
                        <% if SiteConfig.TwitterLink %>
                        <li>
                            <a href="$SiteConfig.TwitterLink" target="_blank"><i class="fa-brands fa-x-twitter"></i> </a>
                        </li>
                        <% end_if %>
                        <% if SiteConfig.InstagramLink %>
                        <li>
                            <a href="$SiteConfig.InstagramLink" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                        </li>
                        <% end_if %>
                        <% if SiteConfig.YouTubeLink %>
                        <li>
                            <a href="$SiteConfig.YouTubeLink" target="_blank"><i class="fa-brands fa-youtube"></i></a>
                        </li>
                        <% end_if %>
                        <% if SiteConfig.TikTokLink %>
                            <li>
                                <a href="$SiteConfig.TikTokLink" target="_blank"><i class="fa-brands fa-tiktok"></i></i></a>
                            </li>
                        <% end_if %>
                        <% if SiteConfig.LinkedInLink %>
                        <li>
                            <a href="$SiteConfig.LinkedInLink" target="_blank"><i class="fa-brands fa-linkedin"></i></a>
                        </li>
                        <% end_if %>
                </ul>
            </div>
            <div class="cell large-4">
                <ul class="menu">
                    <li>
                    <a href="https://rowegroup.com/">© Copyright $Now.Year Site by RoweGroup.com</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>