<div id="SlideOut01" class="slide-out-container">
    <div class="menu-panel">
        <div class="btn-contain">
        <span class="menu-title">Menu</span>
            <button class="menu-close-btn" tabindex="0">
                Close X
            </button>
        </div>
        <div class="menu-container">
            <ul class="vertical menu accordion-menu" data-accordion-menu>
                <% loop Menu(1) %>
                    <% if Children %>
                        <li>
                        <a href="#">$MenuTItle</a>
                        <% if Children %>
                            <ul class="menu vertical nested tritary">
                                <% loop Children %>
                                    <li><a href="$Link">$MenuTitle</a></li>
                                <% end_loop %>
                            </ul>
                        <% end_if %>
                    </li>
                    <% else %>
                        <li><a href="$Link">$MenuTitle</a></li>
                    <% end_if %>
                <% end_loop %>
              </ul>
        </div>
        <div class="menu-container">
            <% loop $getStoreLocationPage %>
                <div>
                    <a href="$Link">
                        <p><strong>$StoreName</strong></p>
                        <p>$City, $State</p>
                        <p>$Address</p>
                    </a>
                    <a href="tel:$Phone"><p><i class="fa-solid fa-phone"></i> $Phone</p></a>
                </div>
            <% end_loop %>
        </div>
        <div class="menu-container">
            <a href="#" data-remodal-target="modal-consultation" class="button expanded">Click To Get Started</a>
        </div>
    </div>
</div>

<div class="menu-bg-overlay"></div>