<% include RowWrap %>
<div id="cart">
	<div class="row">
		<div class="column">
			<h1 class="page-title small-only-text-center">Your Shopping Cart</h1>
		</div>
	</div>
	<div class="row">
		<div class="column large-8 medium-12">
			<div class="cart-table small-only-text-center medium-only-text-center">
				<div class="row collapse cart-table__header">
					<div class="column small-6">Product Description</div>
					<div class="column small-6">
						<div class="row collapse">
							<div class="column small-12 medium-6">
								<div class="row collapse">
									<div class="column small-12 medium-12 large-6">Unit Price</div>
									<div class="column small-12 medium-12 large-6">Quantity</div>
								</div>
							</div>
							<div class="column small-12 medium-6">Total</div>
						</div>
					</div>
				</div>
				<% if GetCartMessage %>
				<div class="window customcart-notice<% if GetCartMessage.type %> {$GetCartMessage.type}<% end_if %>">
					{$GetCartMessage.message}
					<a href="#" class="close right">Hide</a>
				</div>
				<% end_if %>
				<div class="empty-message" <% if GetCartItems %>style="display:none;"<% end_if %>>Cart is empty</div>
				<% if GetCartItems %>
				<% loop GetCartItems %>
				<div class="row collapse cart-table__row" id="cart-item-{$id}">
					<div class="column small-6 desc">
						<div class="row collapse">
							<div class="column large-6 medium-6 small-12">
								<a href="{$url}" class="cart-item-img">
									<img src="{$photo}" />
								</a>
							</div>
							<div class="column large-6 medium-6 small-12 cart-item-desc">
								<a href="{$url}" class="cart-item-link">{$name}</a>
								<a href="#" class="cart-item-remove" onclick="CustomCartRemoveItem('{$id}'); return false;">Remove</a>
							</div>
						</div>
						<div class="cart-remove-link">
						</div>
					</div>
					<div class="column small-6 medium-6">
						<div class="row collapse">
							<div class="column small-12 medium-6">
								<div class="row collapse">
									<div class="column small-12 medium-12 large-6 price">{$unitprice}</div>
									<div class="column small-12 medium-12 large-6 qty cart-func">
										<div class="cart-qty">
											<form name="cart-qty-updater">
												<input type="text" name="qty" value="{$quantity}" data-origval="{$quantity}" data-maxqty="{$max_quantity}" autocomplete="off" />
												<div class="cart-qty-controller">
													<a href="#" class="cart-inc-qty"></a>
													<a href="#" class="cart-dec-qty"></a>
												</div>
											</form>
											<a href="#" class="cart-qty-refresh" onclick="CustomCartUpdateItemQty('{$id}'); return false;">Update</a>
										</div>
									</div>
								</div>
							</div>
							<div class="column small-12 medium-6">
								<div class="show-for-small-only small-total-label">Item Total</div>
								<div class="total">{$itemtotal}</div>
							</div>
						</div>
					</div>
				</div>
				<% end_loop %>
				<% end_if%>
			</div>
			<div class="callout custom cart-options small-only-text-center text-right">
				<% if ShopLink %>
					<a href="{$ShopLink}" class="button">Continue Shopping</a>
				<% end_if %>
				<button id="cart-clear-button">Clear Cart Items</button>
			</div>
		</div>
		<div class="column large-4 medium-12">
			<div class="cart-subtotal">
				Subtotal
				<div id="cart-subtotal" class="cart-price-line">{$GetSubtotal}</div>
			</div>
			<div class="callout custom">
				<div class="shipping-cost">
					<div><strong>Shipping</strong> <span id="cart-weight-total"></span></div>
					<div id="cart-shipping-cost" class="cart-price-line"></div>
					<div id="calculate-shipping">The cost of shipping can vary with item weight, quantities, and your location. You will be contacted with the shipping cost before processing.</div>
				</div>
				<div class="order-total">
					<strong>Estimated Total</strong>
					<div id="cart-total" class="cart-price-line cart-price-line--total">{$GetSubtotal} + Shipping</div>
				</div>
			</div>
			<% if GetCartItems %>
			<div class="show-for-large-up">
				<a href="{$CheckoutURL}" id="cart-checkout-button" class="button">Proceed to Order Request</a>
			</div>
			<% end_if %>
		</div>
	</div>
	<% if GetCartItems %>
	<div id="order-request-form" class="row">
		<div class="column large-8 medium-12">
			<h3>Send Order Request</h3>
			<div class="customcart-notice info">
				<p>You will be contacted before your order is processed to verify the shipping cost. Your payment information will be gathered over the phone.</p>
				<p>Thank you.</p>
			</div>
			{$ShoppingCartRequestForm}
		</div>
	</div>
	<% end_if %>
</div>
<% include RowWrapEnd %>
