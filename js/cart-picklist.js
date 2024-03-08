function cartTabBounce(element, times, distance, speed)
{
    for(var i = 0; i < times; i++) {
        element.animate({marginRight: '+='+distance+'px'}, speed)
            .animate({marginRight: '-='+distance+'px'}, speed);
		distance = Math.floor(Math.sqrt(distance))*2;
		if(distance <= 0) {
			distance = 1;
		}
    }
}

$(function() {

    $('form.customcart-addtocart').on('submit', function (e) {

        var form = $(this);
        var item = {};
        var hasError = false;

        var itemID = form.find('input[name=itemid]').val();
        if(typeof itemID != 'undefined') {
            item.id = itemID;
        }
        var itemName = form.find('input[name=itemname]').val();
        if(typeof itemName != 'undefined') {
            item.name = itemName;
        }
        var itemCode = form.find('input[name=itemnr]').val();
        if(typeof itemCode != 'undefined') {
            item.code = itemCode;
        }
        var imageUrl = form.find('input[name=imageurl]').val();
        if(typeof imageUrl != 'undefined') {
            item.image = imageUrl;
        }
        var itemPrice = form.find('input[name=price]').val();
        if(typeof itemPrice != 'undefined') {
            item.price = itemPrice;
        }
        var itemUrl = form.find('input[name=itemurl]').val();
        if(typeof itemUrl != 'undefined') {
            item.url = itemUrl;
        }
        var itemWeight = form.find('input[name=weight]').val();
        if(typeof itemWeight != 'undefined') {
            item.weight = itemWeight;
        }
        var itemQuantity = form.find('input[name=qty]').val();
        if($.isNumeric(itemQuantity)) {
            itemQuantity = Math.round(itemQuantity);
            if(itemQuantity <= 0) {
                itemQuantity = 1;
            }
        } else {
            itemQuantity = 1;
        }
        if(typeof itemQuantity != 'undefined') {
            item.quantity = itemQuantity;
        }
        var maxqty = form.find('input[name=maxqty]').val();
        if(typeof maxqty != 'undefined') {
            item.quantity_max = maxqty;
        }

        if(!hasError)
        {
            $('#customcart-notification').text('...').removeClass('success error').stop(true).fadeIn('fast');

            var script_path = '/ShoppingCart/additem';
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: script_path,
                cache: false,
                data: JSON.stringify({'item':item})
            }).done(function(data) { // called when successful
                //console.log(data);
                if(typeof data != 'undefined')
                {
                    if(data.error == 0)
                    {
                        $('#customcart-notification').text(data.message).removeClass('error').addClass('success').delay(3000).fadeOut('slow');
						// bounce the cart tab
						var cartTab = $('.shoppingcart-fixed');
						if(cartTab.length) {
							cartTab.show();
							if(typeof data.cart_item_count != 'undefined') {
								cartTab.find('a span').text(data.cart_item_count);
							}
							cartTabBounce(cartTab, 3, 20, 200);
						}
                    }
                    else
                    {
                        $('#customcart-notification').text(data.message).removeClass('success').addClass('error').stop(true).fadeIn('fast').delay(8000).fadeOut('slow');
                    }
                }
            }).fail(function(e) { // called when there is an error
                //console.log(e.message);
            }).always(function() {
                //console.log(dataJSON);
            });
        }
        else
        {
            $('#customcart-notification').text('An Error Occurred').removeClass('success').addClass('error').stop(true).fadeIn('fast').delay(5000).fadeOut('slow');
        }

        e.preventDefault();
        return false;
    });

    var cart_checkout_button = $('#cart-checkout-button');
    if(cart_checkout_button.length)
    {
        cart_checkout_button.on('click', function(){
            var formCont = $('#order-request-form');
            if(formCont.length) {
                $('html,body').scrollTop(formCont.offset().top);
            }
            return false;
        });
    }

    var clear_cart_button = $('#cart-clear-button');
    if(clear_cart_button.length)
    {
        clear_cart_button.on('click', function(){

            var script_path = '/ShoppingCart/empty';
            $.ajax({
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                url: script_path,
                cache: false,
                data: JSON.stringify({})
            }).done(function(data) { // called when successful
                if(typeof data != 'undefined')
                {
                    console.log(data);
                    // refresh the page
                    window.location.reload()
                }
            }).fail(function(e) { // called when there is an error
                console.log(e.message);
                alert('An Error Occurred');
            });

            return false;
        });
    }

    $('.cart-inc-qty').on('click', function() {
        var valInput = $(this).closest('form').find('input').first();
        if(valInput.length) {
            var origVal = valInput.data('origval');
            if(typeof origVal == 'undefined') {
                origVal = -1;
            }
            var maxVal = valInput.data('maxqty');
            if(typeof maxVal == 'undefined') {
                maxVal = 0; // no limit
            }
            var curVal = valInput.val();
            var newVal = 0;
            if(+curVal == curVal && !(curVal % 1) && +curVal >= 0)
            { // is int
                newVal = (+curVal) + 1;
                if((+maxVal) > 0 && newVal > (+maxVal)) {
                    newVal = (+maxVal);
                }
            }
            else
            { // invalid input. Update to 1
                newVal = 1;
            }
            valInput.val(newVal);

            if(newVal != origVal)
            { // show update action link
                $(this).closest('.cart-qty').find('.cart-qty-refresh').show();
            }
            else
            { // hide update action link
                $(this).closest('.cart-qty').find('.cart-qty-refresh').hide();
            }
        }
        return false;
    });
    $('.cart-dec-qty').on('click', function() {
        var valInput = $(this).closest('form').find('input').first();
        if(valInput.length) {
            var origVal = valInput.data('origval');
            if(typeof origVal == 'undefined') {
                origVal = -1;
            }
            var curVal = valInput.val();
            var newVal = 0;
            if(+curVal == curVal && !(curVal % 1) && +curVal >= 0 && +curVal > 0)
            { // is int
                newVal = (+curVal) - 1;
            }
            valInput.val(newVal);

            if(newVal != origVal)
            { // show update action link
                $(this).closest('.cart-qty').find('.cart-qty-refresh').show();
            }
            else
            { // hide update action link
                $(this).closest('.cart-qty').find('.cart-qty-refresh').hide();
            }
        }
        return false;
    });

    $('.cart-qty input[name="qty"]').on("propertychange change click keyup input paste", function(event) {

        var origVal = $(this).data('origval');
        if(typeof origVal == 'undefined') {
            origVal = -1;
        }
        if($(this).val() != origVal)
        { // show update action link
            $(this).closest('.cart-qty').find('.cart-qty-refresh').show();
        }
        else
        { // hide update action link
            $(this).closest('.cart-qty').find('.cart-qty-refresh').hide();
        }
    });
	
	

});

function CustomCartRemoveItem(item_id)
{
    var script_path = '/ShoppingCart/removeitem';
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: script_path,
        cache: false,
        data: JSON.stringify({'item':{id: item_id}})
    }).done(function(data) { // called when successful
        if(typeof data != 'undefined')
        {
            console.log(data);

            // refresh the page
            window.location.reload()

            // Remove item in HTML
            /*console.log('Removing item by id: cart-item-'+item_id);
             $('#cart-item-'+item_id).remove();
             if(data.cart_item_count == 0)
             {
             console.log('show empty message');
             $('#cart').find('.empty-message').show();
             }*/
        }
    }).fail(function(e) { // called when there is an error
        console.log(e.message);
        alert('An Error Occurred');
    })

    return false;
}

function CustomCartUpdateItemQty(item_id)
{
    var item = $('#cart-item-'+item_id);
    if(!item.length) {
        return false;
    }
    var qtyInput = item.find('.cart-qty input[name="qty"]');
    if(!qtyInput.length) {
        return false;
    }
    var new_quantity = qtyInput.val();
    if(+new_quantity == new_quantity && !(new_quantity % 1) && +new_quantity >= 0)
    { // is int
        new_quantity = (+new_quantity); // coerce
    }
    else
    {
        new_quantity = 1;
        qtyInput.val(new_quantity);
    }

    var script_path = '/ShoppingCart/UpdateItemQuantity';
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: script_path,
        cache: false,
        data: JSON.stringify({'item':{id: item_id, quantity: new_quantity}})
    }).done(function(data) { // called when successful
        if(typeof data != 'undefined')
        {
            console.log(data);

            // refresh the page
            window.location.reload()
        }
    }).fail(function(e) { // called when there is an error
        console.log(e.message);
        alert('An Error Occurred');
    })

    return false;
}