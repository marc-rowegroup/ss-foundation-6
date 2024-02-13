<div class="service-section grid-container full align-middle">
    <div class="grid-x grid-padding-x grid-padding-y">
        <% loop PageById(6) %>
            <% loop Children %>
                <div class="cell large-6 medium-12 small-12">
                    <div style="background-image:url($CategoryImage.Link);border-radius:8px;">
                        <div class="service-panel dark-overlay">
                            <div class="panel-content">
                                <span>$SiteConfig.Title</span>
                                <h2>$title</h2>
                                <p>$CategoryBlurb</p>
                            </div>
                            <div class="button-contain">
                                <a href="$Link" class="button large">View Services</a>
                            </div>
                        </div>
                    </div>
                </div>
            <% end_loop %>
       <% end_loop %>
    </div>
</div>
