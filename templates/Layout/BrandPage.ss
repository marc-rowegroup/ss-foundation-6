<% if Content || Form %>
<div class="grid-container <% if PageLayout=0 %>full<% end_if %>" role="main">
    <div class="grid-x grid-padding-x grid-padding-y align-middle">
        <div class="cell">
            <div class="<% if PageLayout=0 %><% else %>content-container<% end_if %> main">
                $Content
                $Form
            </div>
        </div>
    </div>
</div>
<% end_if %>

<div id="brand-group" class="grid-container">
    <% if ShowActionPhotos %>
    <div class="grid-x grid-padding-x grid-padding-y large-up-3">
        <% loop Brands  %>
        <div class="cell">
            <div id="brand-$ID" class="card">
                <% if ActionPhoto %>
                    <div class="action-photo text-center" data-aos="fade-right">
                        <% if BrandLink %>
                        <a class="norespond" <% if NewWindow=1 %>target="_blank"
                            <% else %>
                            <% end_if %> href="$BrandLink">
                            <% end_if %>
                            <div class="brand-zoom-container">
                                <img class="brand-zoom" title="We work hard to provide you with an array of products. That's why we offer $BrandName for your convenience." alt="We work hard to provide you with an array of products. That's why we offer $BrandName for your convenience." src="$ActionPhoto.FitMax(460,320).URL" />
                            </div>
                            <% if BrandLink %>
                        </a>
                        <% end_if %>
                    </div>
                <% end_if %>
                <div class="card-section" data-aos="fade-left">
                    <% if BrandName %>
                    <h3 class="brand-title">
                        <% if BrandLink %><a href="$BrandLink" <% if NewWindow=1 %>target="_blank"<% end_if %>><% end_if %>
                        $BrandName
                        <% if BrandLink %></a><% end_if %>
                    </h3>
                    <% end_if %>
                    <% if BrandDescription %>
                    <div class="action-shot-description">
                    <p>$BrandDescription.FirstSentence</p>
                    </div>
                    <% end_if %>
                    <% if BrandLink %><a href="$BrandLink" <% if NewWindow=1 %>target="_blank"
                        <% end_if %> class="button">Learn More</a>
                    <% end_if %>
                </div>

            </div>
        </div>
        <% end_loop %>
    </div>
    <% else %>
    <div class="grid-x grid-padding-x grid-padding-y large-up-4">
        <% loop Brands  %>
        <div class="cell">
            <div id="brand-$ID" class="card text-center">
                <div class="brand-content card-section">
				<% if BrandPhoto %>
					<div class="brand-photo">
						<% if BrandLink %>
							<a class="norespond" alt="We work hard to provide you with an array of products. That's why we offer $BrandName for your convenience." title="We work hard to provide you with an array of products. That's why we offer $BrandName for your convenience." <% if NewWindow=1 %>target="_blank"
						<% else %>
						<% end_if %> href="$BrandLink">
						<% end_if %>
                        <img class="brand-zoom" title="We work hard to provide you with an array of products. That's why we offer $BrandName for your convenience." alt="We work hard to provide you with an array of products. That's why we offer $BrandName for your convenience." src="$BrandPhoto.FitMax(360,360).URL" />
						<% if BrandLink %>
						</a>
						<% end_if %>
					</div>
				<% end_if %>
				<% if BrandName %>
					<h3 class="brand-title text-center">$BrandName</h3>
				<% end_if %>
				<% if BrandDescription %>
					<p>$BrandDescription.FirstSentence ...<strong>Learn More</strong></p>
				<% end_if %>
				<% if BrandLink %>
					<a class="button" <% if NewWindow=1 %>target="_blank"<% else %><% end_if %> href="$BrandLink">Learn more</a>
				<% end_if %>
				</div>
               
            </div>
        </div>
        <% end_loop %>
    </div>
    <% end_if %>
</div>