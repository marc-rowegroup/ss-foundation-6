<% if FlexSlider %>
   <% include FlexSlider %>
<% else %>
  <% if ShowHero = 1 %>
    <% if HeroSectionTitle || HeroSectionBlurb || VideoEmbedLink %>
      <div class="hero-section" style="background-image:url($HeroBg.Link);background-color:#222;">
          <div class="grid-x grid-padding-x grid-padding-y hero-container">
            <div class="cell large-6 medium-12 small-12 hero-content text-center medium-text-left large-text-left">
              <h1>$HeroSectionTitle</h1>
              <h5>$HeroSectionBlurb</h5>
              <div class="button-group large stacked-for-small">
                <% if $InSection('home') %>
                  <a class="button" href="#" data-remodal-target="modal-consultation" >FREE CONSULTATION</a>
                  <%-- find modal component in Modals.ss --%>
                  <a class="button tritary hollow" href="http://es.safetynetservices">HABLAMOS ESPAÑOL</a>
                <% end_if %>
                <% if $InSection('inicio') %>
                  <a class="button" href="#" data-remodal-target="modal-consultation" >CONSULTA GRATIS</a>
                  <%-- find modal component in Modals.ss --%>
                  <a class="button tritary hollow" href="http://dev.safetynetservices">WE SPEAK ENGLISH</a>
                <% end_if %>
              </div>
            </div>
          </div>
      </div>  
    <% else %>
      <div class="hero-section">
          <div class="grid-x grid-padding-x grid-padding-y hero-container">
            <div class="cell large-6 medium-12 small-12  hero-content">
              <h1>Add Hero Header</h1>
              <h5>Add Hero subtitle about anything you like</h5>
            </div>
          </div>
      </div>  
    <% end_if %>
  <% end_if %>
<% end_if %>


