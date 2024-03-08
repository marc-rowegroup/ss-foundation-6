function addCommas(nStr)
{
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

var americartContents = {};
function updateCart(data)
{
	var hasCartItems = false;
	var pageBigCart = $('#cart');
	if (typeof data != 'undefined' && data)
	{
		//console.log(data);
		var c = data;
		var pageCartItemTpl = $('#cart-row-template');
		var itemCountCont = $('#americart-item-count');
		var tmpl = $("#cart_row_template").html();
		var cartContents = $('#americart-cart-contents');
		var totalWeight = 0;
		
		// clear out current contents of cart
		cartContents.find('.americart-cart-item').remove();
		if(pageBigCart.length)
		{
			pageCartItemTpl.parent().find('.cart-table__row').not(pageCartItemTpl).remove();
		}

		americartContents = {}; // reset
		for (var i = 0, len = c.items.length; i < len; i++)
		{
			var item = c.items[i];
			americartContents[item.itemNumber] = item.quantity;
			var itemTotal = '$' + (item.quantity * item.price).toFixed(2);
			var price = '$' + item.price.toFixed(2);
			totalWeight += item.weight * item.quantity;
			
			//var row = $('<tr class="americart-cart-item"><td class="item">'+item.itemName+'</td><td class="qty">'+item.quantity+'</td><td class="price">'+price+'</td><td class="item_total">'+itemTotal+'</td><td class="options"><a href="#" class="americart-remove" data-rowid="'+item.cartRowId+'">x</a></td></tr>');
			var row = $('<tr class="americart-cart-item"><td class="item">'+item.itemName+'</td><td class="qty">'+item.quantity+'</td><td class="item_total">'+itemTotal+'</td><td class="options"><a href="#" class="americart-remove" title="Remove" data-rowid="'+item.cartRowId+'"></a></td></tr>');

			$('#americart-subtotal').before(row);
			
			// page cart
			if(pageBigCart.length)
			{
				row = pageCartItemTpl.clone();
				row.attr('id', null);
				row.find('.cart-item-desc').first().text(item.itemName);
				row.find('.cart-item-link').first().attr('href', item.itemUrl);
				row.find('.cart-item-img').first().attr('src', item.imageUrl);
				row.find('.price').first().text('$'+item.price);
				row.find('.total').first().text(itemTotal);
				row.find('.cart-qty input').first().val(item.quantity);
				row.find('.cart-remove-link').first().html('<a href="#" class="cart-remove-item" title="Remove" data-rowid="'+item.cartRowId+'">Remove</a>');
				pageCartItemTpl.parent().append(row);
			}
		}
		
		if(c.totalItemCount > 0) {
			hasCartItems = true;
			$('#americart-empty-message').hide();
			cartContents.show();
		} else {
			$('#americart-empty-message').show();
			cartContents.hide();
		}
		
		itemCountCont.text(c.totalItemCount == 0 ? 'Shop' : c.totalItemCount);
		var subtotal = '$' + addCommas(c.subtotal.toFixed(2));
		var grandtotal = '$' + addCommas(c.grandTotal.toFixed(2));
		$('#americart-subtotal__amt').html(subtotal);

		// page cart
		if(pageBigCart.length)
		{
			pageBigCart.find('#cart-subtotal').first().text(subtotal);
			pageBigCart.find('#cart-weight-total').first().text('('+totalWeight+' lbs.)');
			pageBigCart.find('#cart-total').first().text(grandtotal);
		}
	}
	if(!hasCartItems) {
		$('#americart-cart').addClass('empty').removeClass('expanded');
		// page cart
		if(pageBigCart.length)
		{
			pageBigCart.find('.empty-message').fadeIn('fast');
		}
	} else {
		$('#americart-cart').removeClass('empty');
	}
}

function initAmericart(window, $, AC)
{
	if(typeof AmericartDomain == 'undefined') {
		return; // failed init
	}
	
	$('#americart-cart').show();

	AC.init({
		storeDomain: AmericartDomain
	});

	AC.cart.get(function(response) {
		var cart = response.cart || response.data;
		if(cart) {
			updateCart(cart);
		}
	});

	$('form.americart-addtocart').on('submit', function (e) {
		
		var form = $(this);
		var item = {};
		var hasError = false;

		item.itemName = form.find('input[name=itemname]').val();
		item.itemNumber = form.find('input[name=itemnr]').val();
		var imageUrl = form.find('input[name=imageurl]').val();
		if(typeof imageUrl != 'undefined') {
			item.imageUrl = imageUrl;
		}
		item.price = parseFloat(form.find('input[name=price]').val());
		item.itemUrl = form.find('input[name=itemurl]').val();
		var unitOfMeasure = form.find('input[name=unit]').val();
		if(typeof unitOfMeasure != 'undefined') {
			item.unitOfMeasure = unitOfMeasure;
		}
		var itemWeight = parseFloat(form.find('input[name=weight]').val());
		if(typeof itemWeight != 'undefined') {
			item.weight = itemWeight;
		}
		item.codedAmountPerItem = parseFloat(form.find('input[name=codedamtperitem]').val());
		item.quantity = form.find('input[name=qty]').val();
		if($.isNumeric(item.quantity)) {
			item.quantity = Math.round(item.quantity);
			if(item.quantity <= 0) {
				item.quantity = 1;
			}
		} else {
			item.quantity = 1;
		}
		var maxqty = form.find('input[name=maxqty]').val();
		if(typeof maxqty != 'undefined') {
			item.maxqty = maxqty;
			var currentQty = americartContents[item.itemNumber];
			if(typeof currentQty != 'undefined' && $.isNumeric(currentQty) && currentQty+item.quantity > maxqty) {
				hasError = true;
			}
		}
		var noDiscount = form.find('input[name=nodiscount]').val();
		if(typeof noDiscount != 'undefined') {
			item.doNotDiscount = noDiscount == 'true';
			item.nodiscount = noDiscount == 'true' ? 1 : 0;
		}
		var gobackto = form.find('input[name=gobackto]').val();
		if(typeof gobackto != 'undefined') {
			item.continueShopping = gobackto;
		}
		//console.log('item');
		//console.log(item);
		
		if(!hasError)
		{
			$('#americart-notification').text('...').removeClass('success error').stop(true).fadeIn('fast');
			
			AC.cart.add(item, function(response) {
				var cart = response.cart || response.data;
				if(response && response.status != 'Failed')
				{
					updateCart(cart);
					$('#americart-notification').text('Item was added to cart').removeClass('error').addClass('success').delay(3000).fadeOut('slow');
					$('#americart-cart').addClass('expanded');
				}
				else
				{
					//console.log(item);
					//console.log(response);
				}
			});
		}
		else
		{
			$('#americart-notification').text('Invalid Quantity').removeClass('success').addClass('error').stop(true).fadeIn('fast').delay(3000).fadeOut('slow');
		}

		e.preventDefault();
		return false;
	});

	$('#americart-clear-cart').on('click', function(e) {
		e.preventDefault();
		AC.cart.clear(function(response) {
			var cart = response.cart || response.data;
			updateCart(cart);
		});
		return false;
	});
	
	$('#cart-clear-button').on('click', function(e) {
		e.preventDefault();
		AC.cart.clear(function(response) {
			var cart = response.cart || response.data;
			updateCart(cart);
		});
		return false;
	});
	
	$('#americart-cart-contents').on('click', '.americart-remove', function(e) {
		$(this).closest('tr').remove();
		var rowID = $(this).data('rowid');
		if(rowID)
		{
			AC.cart.remove(rowID, function(response) {
				var cart = response.cart || response.data;
				if(response && response.status != 'Failed')
				{
					//console.log('Removed item: '+rowID);
					updateCart(cart);
				}
				else
				{
					//console.log('Remove Failed: '+rowID);
					//console.log(response);
				}
			});
		}
		return false;
	});
	
	$('.cart-table').on('click', '.cart-remove-item', function(e) {
		$(this).closest('.cart-table__row').remove();
		var rowID = $(this).data('rowid');
		if(rowID)
		{
			AC.cart.remove(rowID, function(response) {
				var cart = response.cart || response.data;
				if(response && response.status != 'Failed')
				{
					//console.log('Removed item: '+rowID);
					updateCart(cart);
				}
				else
				{
					//console.log('Remove Failed: '+rowID);
					//console.log(response);
				}
			});
		}
		return false;
	});
	

	$('#americart-toggle-cart').on('click', function(e) {
		if($('#americart-cart').hasClass('empty') && $(this).attr('href') != '#') {
			// allow navigating to the link
			return true;
		}
		// show cart dropdown
		e.stopPropagation();
		$('#americart-cart').toggleClass('expanded');
		return false;
	});
	
	$('#americart-cart').on('click', function(e) {
		e.stopPropagation();
	});
	
	$(document).on('click', function() {
		$('#americart-cart').removeClass('expanded');
	});
	
}
