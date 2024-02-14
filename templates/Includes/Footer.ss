<footer class="footer">
    <div class="grid-container">
        <div class="grid-x grid-padding-x grid-padding-y footer-content">
            <div class="cell large-6 text-center medium-text-left large-text-left">
                <% loop $getStoreLocationPage %>
                    <div class="grid-x">
                        <div class="cell large-4">
                            <% include SafetynetLogoFooter %>
                        </div>
                        <div class="cell large-8">
                            <h3>$StoreName</h3>
                            <p>$Address</p>
                            <p>$City, $State $Postcode</p>
                            <a href="$NavigationLink" target="_blank" class="button tritary hollow small">Get Directions</a>
                        </div>
                    </div>
                <% end_loop %>
            </div>
            <div class="cell large-3">
                <h3>Services</h3>
                <% if $InSection('home') %>
                    <% loop $ChildrenOf('services') %>
                        <ul class="vertical menu">
                            <li><a href="$Link">$Title</a></li>
                        </ul>
                    <% end_loop %>
                <% end_if %>
                <% if $InSection('inicio') %>
                    <% loop $ChildrenOf('servicios') %>
                        <ul class="vertical menu">
                            <li><a href="$Link">$Title</a></li>
                        </ul>
                    <% end_loop %>
                <% end_if %>
            </div>
            <div class="cell large-3">
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
            <div class="cell large-6">
                <ul class="menu align-left">
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
                        <li class="menu-text" >Follow Us!</li>
                </ul>
            </div>
            <div class="cell large-6">
                <ul class="menu align-right">
                    <li >
                    <a href="https://rowegroup.com/">© Copyright $Now.Year Site by RoweGroup.com</a>
                    </li>
                    <%-- <li>
                        <% loop $MenuSet('Footer').MenuItems %>
                        <a href="$Link" class="$LinkingMode">$MenuTitle</a>
                        <% end_loop %>
                    </li> --%>
                </ul>
            </div>
        </div>
    </div>
</footer>