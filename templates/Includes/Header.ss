<header id="header" class="header-container">
        <div class="flex-col">
            <a class="header-logo" href="{$baseUrl}">
                <% include SafetynetLogoHeader %>
                <h1 class="show-for-large-up" style="font-size:20px;font-weight:600;padding:0;margin:0;">
                    $SiteConfig.Title
                </h1>
            </a>
        </div>
        <div class="flex-col">
                <% include MegaMenu %>
                <ul class="menu align-center" style="gap:6px">
                    <% loop $getStoreLocationPage %><li><a href="tel:$Phone" class="call-us"><i class="fa-solid fa-phone"></i> $Phone</a></li><% end_loop %>
                    <li><a href="" class="button">Get Started</a></li>
                    <li><a class="slide-out-btn button secondary" id="slideMenu01">Menu</a></li>
                    <li>
                        <select>
                            <option value="english">English</option>
                            <option value="spanish">Espanol</option>
                        </select>
                    </li>
                </ul>
        </div>
        <%-- <div>
            <ul class="menu align-center">
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
        </div> --%>
</header>

<%-- <% include TopBar %> --%>
    