<% cached 'brands', $List('Brand').max('LastEdited'), $List('Brand').count() %>
<div class="brand-section">
    <div class="grid-container fluid">
        <div class="grid-x grid-padding-x grid-padding-y align-middle">
            <div class="cell large-1 text-center">
                <a href="" class="round-btn nav-btn brand-prev-arrow">
                    <svg xmlns="https://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <path d="M4 12L3.29289 11.2929L2.58579 12L3.29289 12.7071L4 12ZM19 13C19.5523 13 20 12.5523 20 12C20 11.4477 19.5523 11 19 11V13ZM9.29289 5.29289L3.29289 11.2929L4.70711 12.7071L10.7071 6.70711L9.29289 5.29289ZM3.29289 12.7071L9.29289 18.7071L10.7071 17.2929L4.70711 11.2929L3.29289 12.7071ZM4 13H19V11H4V13Z" fill="black"/>
                    </svg>
                </a>
            </div>
           <div class="cell large-10 text-center">
             <%-- <h2>Our Brands</h2> --%>
             <div class="brand-carousel">
                 <% loop getLines %>
                     <% if ShowHome = 1 %>
                         <a href="$Link" alt="$BrandName" title="$BrandName">
                         <div class="card">
                             <div class="card-section">
                             <%-- <img data-lazy="$BrandPhoto.URL" alt="$Up.Up.BrandName" /> --%>
                             $BrandPhoto
                             </div>
                         </div> 
                         </a>
                     <% end_if %>				
                 <% end_loop %>	
             </div>
           </div>
           <div class="cell large-1 text-center">
                <a href="" class="round-btn nav-btn brand-next-arrow">
                    <svg xmlns="https://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                    <path d="M20 12L20.7071 11.2929L21.4142 12L20.7071 12.7071L20 12ZM5 13C4.44771 13 4 12.5523 4 12C4 11.4477 4.44771 11 5 11V13ZM14.7071 5.29289L20.7071 11.2929L19.2929 12.7071L13.2929 6.70711L14.7071 5.29289ZM20.7071 12.7071L14.7071 18.7071L13.2929 17.2929L19.2929 11.2929L20.7071 12.7071ZM20 13H5V11H20V13Z" fill="black"/>
                    </svg>
                </a>
            </div>
        </div>
     </div>
</div>
<% end_cached %>