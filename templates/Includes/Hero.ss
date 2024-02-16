<% if FlexSlider %>
   <% include FlexSlider %>
<% else %>
  <% if ShowHero = 1 %>
    <% if HeroSectionTitle || HeroSectionBlurb || VideoEmbedLink %>
      <div class="hero-section" style="background-image:url($HeroBg.Link);background-color:#222;">
          <div class="grid-x grid-padding-x grid-padding-y hero-container">
            <div class="cell hero-content">
              <h1>$HeroSectionTitle</h1>
              <h5>$HeroSectionBlurb</h5>
            </div>
          </div>
      </div>  
    <% else %>
      <div class="hero-section">
          <div class="grid-x grid-padding-x grid-padding-y hero-container">
            <div class="cell hero-content">
              <h1>Add Hero Header</h1>
              <h5>Add Hero subtitle about anything you like</h5>
            </div>
          </div>
      </div>  
    <% end_if %>
  <% end_if %>
<% end_if %>


