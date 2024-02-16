<div class="quoteform-section">
    <div class="dark-overlay">
        <div class="grid-container">
            <div class="grid-x grid-padding-x grid-padding-y quoteform-section-content align-middle">
                <div class="cell large-6 text-center medium-text-left large-text-left">
                    <% if $InSection('home') %>
                        <h3>
                            Are you ready<br>to experience the<br>$SiteConfig.Title difference?
                        </h3>
                        <p>Fill out the form and we will reach out to you shortly</p>
                    <% end_if %>
                </div>
                <div class="cell large-6">
                    $QuestionForm
                </div>
            </div>
        </div>
    </div>
</div>