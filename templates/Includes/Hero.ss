<%-- Hero can be found in Homepage.php --%>
<% if ShowHero = 1 %>
    <% if HeroSectionTitle || HeroSectionBlurb || VideoEmbedLink %>
      <div class="hero-section" style="background-image:url($HeroBg.Link);background-color:#222;">
        <div class="grid-container">
          <div class="grid-x grid-padding-x grid-padding-y hero-content align-middle">
            <div class="cell text-center" data-aos="fade-up">
              <h1>$HeroSectionTitle</h1>
              <h5>$HeroSectionBlurb</h5>
            </div>
          </div>
        </div>
      </div>  
    <% else %>
      <div class="hero-section">
        <div class="grid-container">
          <div class="grid-x grid-padding-x grid-padding-y hero-content align-middle">
            <div class="cell text-center" data-aos="fade-up">
              <h1>Add Hero Header</h1>
              <h5>Add Hero subtitle about anything you like</h5>
            </div>
          </div>
        </div>
      </div>  
    <% end_if %>
<% end_if %>



