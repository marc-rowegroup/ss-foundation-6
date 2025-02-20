<%-- <% if FeaturesPanel %> --%>
<div class="feature-panel">
    <div class="grid-container" <% if $FeatureSectionBg %> style="background-image:url($FeatureSectionBg.URL);background-size:contain;background-position:top;background-attachment: scroll;background-blend-mode: multiply;"<% end_if %>>
            <div class="grid-x grid-padding-x grid-padding-y align-center align-middle text-left p-96">
                <% if $FeatureSectionTitle || $FeatureSectionSummary %>
                    <div class="cell large-5 text-center p-20">
                        <% if $FeatureSectionTitle %>
                            <h2>$FeatureSectionTitle</h2>
                        <% end_if %>
                        <% if $FeatureSectionTitle %>
                        <h3>$FeatureSectionSubTitle</h3>
                        <% end_if %>
                        <% if $FeatureSectionSummary %>
                            <p>$FeatureSectionSummary</p>
                        <% end_if %>  
                    </div>
                <% end_if %>
            
                    <div class="cell">
                        <div class="grid-x grid-padding-x grid-padding-y large-up-4">
                            <% loop $FeaturePanels.Limit(12) %>
                                <div class="cell">
                                        <div class="card">
                                            <% if $FeatureImage %>
                                                <img src="$FeatureImage.URL" alt="$FeatureImage.Title" width="$FeatureImage.Width" height="$FeatureImage.Height" loading="lazy">
                                            <% end_if %>
                                            <div class="card-section">
                                                <h3 class="card-title" data-aos="fade-up" data-aos-delay="500">$Title</h3>
                                                <% if $Summary %>
                                                    <p data-aos="fade-up" data-aos-delay="500">$Summary</p>
                                                <% end_if %>
                                                <%-- <a href="$Link" class="button light" data-aos="fade-up" data-aos-delay="500"> View $Title</a> --%>
                                            </div>
                                        </div>  
                                </div>
                            <% end_loop %>
                        </div>
                    </div>

                <%-- <div class="cell p-20">
                    <div class="button-group stacked-for-small">
                        <a href="" class="button light hollow">Learn More</a>
                        <a href="" class="button light hollow">View Products</a>
                    </div>
                </div> --%>
            </div>
    </div>
</div>
<%-- <% end_if %> --%>

