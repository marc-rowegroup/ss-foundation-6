
<header id="header" class="header-container">
    <div class="flex-col">
        <% if SiteConfig.SiteLogo %>
            <a href="/" class="logo-contain">
                $SiteConfig.SiteLogo
            </a>
            <% else %>
            <h1 class="show-for-large-up" style="font-size:20px;font-weight:600;padding:0;margin:0;">
                <a style="" href="{$baseUrl}">$SiteConfig.Title</a>
            </h1>
        <% end_if %>
    </div>
    <div class="flex-col">
        <% include MegaMenu %>
    </div>
    <div class="flex-col">
            <ul class="menu align-center" style="gap:6px">
                <li class="hide-for-small-only"><a href="#" data-remodal-target="modal-consultation" class="button">Get Started</a></li>
                <%-- find modal component in Modals.ss --%>
                <li class="show-for-small-only"><a class="slide-out-btn button tritary" id="slideMenu01"><i class="fa-solid fa-bars"></i> Menu</a></li>
            </ul>
            <ul class="menu align-center hide-for-small-only">
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
</header>