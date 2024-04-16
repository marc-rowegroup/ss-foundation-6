
<% include Success %>
<% if $Content %>
<div class="grid-container <% if PageLayout=0 %>full<% end_if %>" role="main">
	<div class="grid-x grid-padding-x grid-padding-y align-middle">	
		<div class="cell">
			<div class="content-container main">
				$Content
			</div>
		</div>
	</div>
</div>
<% end_if %>
<div class="grid-container">
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell small-12 medium-6 large-6">
			<div class="grid-x">
				<div class="cell small-12 medium-6 large-6 locale-info">
					<h3 class="location-block-heading">
						<% if $CurrentSubsite.Title == 'Spanish' %>
							Información de la Oficina
						<% else %>
							Office Info
						<% end_if %>
					</h3>
					<p>
						<% if $CurrentSubsite.Title == 'Spanish' %>
							<% if StoreName %><strong>$StoreName</strong><br/><% end_if %>
							<% if POBox %>$POBox<br/><% end_if %>
							<% if Address %>$Address<br/><% end_if %>
							<% if City %>$City,<% end_if %>
							<% if State %>$State<% end_if %>
							<% if Postcode %>$Postcode<br/><% end_if %>
							<% if Phone %><strong>Teléfono</strong> <a href="tel:$Phone" class="link-black ga-track-hover ga-track-click" data-phone="" data-mobileclick="">$Phone</a><br/><% end_if %>
							<% if TollFree %><strong>Llamada gratuita</strong> <a href="tel:$TollFree" class="link-black ga-track-hover ga-track-click" data-phone="" data-mobileclick="">$TollFree</a><br/><% end_if %>
							<% if AfterhoursEmergency %><strong>Emergencia fuera de horario</strong> <a href="tel:$AfterhoursEmergency">$AfterhoursEmergency</a><br/><% end_if %>
							<% if AfterhoursParts %><strong>Emergencia fuera de horario - Piezas</strong> <a href="tel:$AfterhoursParts">$AfterhoursParts</a><br/><% end_if %>
							<% if AfterhoursService %><strong>Emergencia fuera de horario - Servicio</strong> <a href="tel:$AfterhoursService">$AfterhoursService</a><br/><% end_if %>
							<% if Fax %><strong>Fax:</strong> $Fax<br/><% end_if %>
							<% if not HideStaff %>
								<a href="#staff">Ver al personal</a>
							<% end_if %>
						<% else %>
							<% if StoreName %><strong>$StoreName</strong><br/><% end_if %>
							<% if POBox %>$POBox<br/><% end_if %>
							<% if Address %>$Address<br/><% end_if %>
							<% if City %>$City,<% end_if %>
							<% if State %>$State<% end_if %>
							<% if Postcode %>$Postcode<br/><% end_if %>
							<% if Phone %><strong>Phone</strong> <a href="tel:$Phone" class="link-black ga-track-hover ga-track-click" data-phone="" data-mobileclick="">$Phone</a><br/><% end_if %>
							<% if TollFree %><strong>Toll Free</strong> <a href="tel:$TollFree" class="link-black ga-track-hover ga-track-click" data-phone="" data-mobileclick="">$TollFree</a><br/><% end_if %>
							<% if AfterhoursEmergency %><strong>After Hours Emergency</strong> <a href="tel:$AfterhoursEmergency">$AfterhoursEmergency</a><br/><% end_if %>
							<% if AfterhoursParts %><strong>After Hours Emergency Parts</strong> <a href="tel:$AfterhoursParts">$AfterhoursParts</a><br/><% end_if %>
							<% if AfterhoursService %><strong>After Hours Emergency Service</strong> <a href="tel:$AfterhoursService">$AfterhoursService</a><br/><% end_if %>
							<% if Fax %><strong>Fax:</strong> $Fax<br/><% end_if %>
							<% if not HideStaff %>
								<a href="#staff">View Staff</a>
							<% end_if %>
						<% end_if %>
					</p>
				</div>
				<div class="cell small-12 medium-6 large-6 locale-info">
					<h3 class="location-block-heading">
						<% if $CurrentSubsite.Title == 'Spanish' %>
							Horario de Oficina
						<% else %>
							Office Hours
						<% end_if %>
						</h3>
					<%-- Timezone --%>
					<% if $StoreTimezone %>
						<h4 class="location-block-subheading">In $StoreTimezone</h4>
					<% end_if %>

					<p>
					<%-- Displaying store hours --%>
					<% loop GetStoreLocationHours(true) %>
						<div class="local-info__hours <% if ExtraHoursOfOperation %>local-info__hours--override<% end_if %>">
							<%-- Monday - Sunday --%>
							<strong class="<% if IsToday %>local-info__today<% end_if %>">$day : </strong>
							<span>$DefaultHoursOfOperation</span>
						</div>
						<%-- Extra hours include holidays and any custom hours --%>
						<% if ExtraHoursOfOperation %>
						<div class="local-info__hours--extra">
							<strong>- $Title: </strong>
							<span>$ExtraHoursOfOperation</span>
						</div>
						<% end_if %>
					<% end_loop %>
					</p>

					<%-- When is the nearest opening for this store --%>
					<% if NearestOpening %>
						<h3 class="location-block-heading">$NearestOpening</h3>
					<% end_if %>

				</div>
			</div>
		</div>
		<div class="cell small-12 medium-6 large-6 contact-section">
			<a href="#" data-remodal-target="modal-locale" class="button large hide-on-print">
				<% if $CurrentSubsite.Title == 'Spanish' %>
					Contáctanos
				<% else %>
					Contact Us
				<% end_if %>
			</a>
			<div class="remodal" data-remodal-options="hashTracking: false" data-remodal-id="modal-locale">
				<button data-remodal-action="close" class="remodal-close"></button>
				<div class="left-centered">
					<% if $CurrentSubsite.Title == 'Spanish' %>
						<h3>Contacta a Ventas en $City, $State</h3>
						<p style="font-size:14px; line-height:21px; margin:0; padding:2px 2px 18px 2px;">Los campos marcados con asteriscos* son obligatorios.</p>
					<% else %>
						<h3>Contact sales at $City, $State</h3>
						<p style="font-size:14px; line-height:21px; margin:0; padding:2px 2px 18px 2px;">Fields with asterisks* are required.</p>
					<% end_if %>
					$ContactFormLocation
				</div>
			</div>
			<% if GetInventoryButtonActions %>
			<div class="call-to-action-button-section">
				<h3>Inquire About Equipment</h3>
				<ul>
					<% loop GetInventoryButtonActions %>
					<li><a href="{$Link}" class="button secondary" data-cl="{$Class}">$Label</a></li>
					<% end_loop %>
				</ul>
			</div>
			<% end_if %>
		</div>
	</div>
	<div class="grid-x grid-padding-x grid-padding-y">
		<% if LocationPhoto %>
		<div class="cell small-12 <% if MapLink %>medium-6 large-6<% else %> medium-12 large-12<% end_if %>">
			<div class="location-pic-respond">$LocationPhoto</div>
		</div>
		<% end_if %>
		<% if MapLink %>
			<div class="cell small-12 <% if LocationPhoto %>medium-6 large-6<% else %> medium-12 large-12<% end_if %>">
				<iframe src="$MapLink&output=embed" name="ssLocationWindow" id="ssLocationWindow" width="100%" height="300" frameborder="0" scrolling="auto"></iframe>
			</div>
		<% end_if %>
	</div>
	<%-- Display staff --%>
	<% if not HideStaff %>
		<div class="grid-x grid-padding-x grid-padding-y staff-holder" id="staff">
			<div class="cell small-12 small-centered">
				<% loop DisplayAllStaff %>
					<%-- Department name --%>
					<% if $Staff %>
					<h4 class="staff-titles">$Title</h4>
					<div class="grid-x grid-padding-x grid-padding-y large-up-5 medium-up-3 small-up-1 staff-section">
						<%-- Staff --%>
							<% loop $Staff %>
							<div class="cell">
								<div class="grid-pad-outer">
									<% if StaffPhoto %>
										<% with StaffPhoto.SetHeight(175) %>
										<img class="my-custom-class" src="$URL" alt="" width="$Width" height="$Height" />
										<% end_with %>
									<% end_if %>
									<div class="staff-info">
										<% if Title %><h5>$Title</h5><% end_if %>
										<% if GetStaffPosition($Top.ID) %><p>$GetStaffPosition($Top.ID)</p><% end_if %>
										<% if Phone %><p>Phone: <a href="tel:$Phone" class="link-black">$Phone</a><% if PhoneExtension %> Ext. {$PhoneExtension} </p><% end_if %><% end_if %>
										<% if Cell %><p>Cell: <a href="tel:$Cell" class="link-black">$Cell</a></p><% end_if %>
									</div>
									<% if Email %>
										<a href="#{$ID}" data-remodal-target="stafflocale-contact" 	class="staff-direct-email button small" data-name="$Title">Email</a>
									<% end_if %>
								</div>
							</div>
							<% end_loop %>
					</div>
				<% end_if %>
				<% end_loop %>
			</div>
		</div>
	<% end_if %>
	<div class="remodal" data-remodal-options="hashTracking: false" data-remodal-id="stafflocale-contact">
	<button data-remodal-action="close" class="remodal-close"></button>
	<div class="left-centered">
		<% if Staff %>
			<% loop Staff %>
				<h4>Contact $Title</h3>
			<% end_loop %>
		<% end_if %>
		{$StaffContactForm}
	</div>
</div>
</div>
