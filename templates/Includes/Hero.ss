<% if FlexSlider %>
  <% include FlexSlider %>
<% else %>
 <% if ShowHero = 1 %>
   <% if HeroSectionTitle || HeroSectionBlurb || VideoEmbedLink %>
     <div class="hero-section" style="background-image:url($HeroBg.Link);background-color:#222;">
         <div class="grid-x grid-padding-x grid-padding-y hero-container">
           <div class="cell large-6 medium-12 small-12 hero-content text-center medium-text-left large-text-left" data-aos="fade-right">
             <h1>$HeroSectionTitle</h1>
             <h5>$HeroSectionBlurb</h5>
             <div class="button-group large stacked-for-small">
               <% if InPage('Home') %>
                 <a class="button" href="#" data-remodal-target="modal-consultation" >FREE CONSULTATION</a>             
                 <a class="button tritary hollow" href="https://es.safetynetdotservices.us/">WE SPEAK SPANISH</a>
               <% end_if %>
               <% if InPage('Inicio') %>
                 <a class="button" href="#" data-remodal-target="modal-consultation" >CONSULTA GRATIS</a>
                 <a class="button tritary hollow" href="https://safetynetdotservices.us/">HABLAMOS INGLÉS</a>
               <% end_if %>
             </div>
           </div>
         </div>
     </div>  
   <% else %>
     <div class="hero-section" style="background-attachment:fixed;">
         <div class="grid-x grid-padding-x grid-padding-y hero-container">
           <div class="cell large-12 medium-12 small-12  hero-content" data-aos="fade-up">
             <h1>Add Hero Header</h1>
             <h5>Add Hero subtitle about anything you like</h5>
           </div>
         </div>
     </div>  
   <% end_if %>
 <% end_if %>
<% end_if %>


