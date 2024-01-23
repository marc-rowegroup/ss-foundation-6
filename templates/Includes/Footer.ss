<footer class="footer">
    <div class="grid-container">
        <div class="grid-x grid-padding-x align-middle">
            <div class="cell large-6">
                <ul class="menu align-center">
                    <li>
                        <% if SiteConfig.FacebookLink %><a href="$SiteConfig.FacebookLink" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <% end_if %>
                    </li>
                    <li>
                        <% if SiteConfig.TwitterLink %><a href="$SiteConfig.TwitterLink" target="_blank"><i class="fab fa-twitter"></i> </a>
                        <% end_if %>
                    </li>
                    <% if SiteConfig.InstagramLink %>
                    <li>
                        <a href="$SiteConfig.InstagramLink" target="_blank"><i class="fab fa-instagram"></i></a>
                    </li>
                    <% end_if %>
                    <li>
                        <% if SiteConfig.YouTubeLink %><a href="$SiteConfig.YouTubeLink" target="_blank"><i class="fab fa-youtube"></i></a>
                        <% end_if %>
                    </li>
                    <li>
                        <% if SiteConfig.LinkedinLink %><a href="$SiteConfig.LinkedinLink" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                        <% end_if %>
                    </li>
                </ul>
            </div>
            <div class="cell large-6">
                <ul class="menu align-center">
                    <li>
                        $Now.Year $SiteConfig.Title
                    </li>
                    <li>
                        <% loop $MenuSet('Footer').MenuItems %>
                        <a href="$Link" class="$LinkingMode">$MenuTitle</a>
                        <% end_loop %>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>