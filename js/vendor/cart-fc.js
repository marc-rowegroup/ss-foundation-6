function cartTabBounce(element, times, distance, speed) {
  for (var i = 0; i < times; i++) {
    element
      .animate({ marginRight: "+=" + distance + "px" }, speed)
      .animate({ marginRight: "-=" + distance + "px" }, speed);
    distance = Math.floor(Math.sqrt(distance)) * 2;
    if (distance <= 0) {
      distance = 1;
    }
  }
}

function addCommas(nStr) {
  nStr += "";
  var x = nStr.split(".");
  var x1 = x[0];
  var x2 = x.length > 1 ? "." + x[1] : "";
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
    x1 = x1.replace(rgx, "$1" + "," + "$2");
  }
  return x1 + x2;
}

function fixedEncodeURIComponent(str) {
  return encodeURIComponent(str).replace(/[!'()*]/g, function (c) {
    return "%" + c.charCodeAt(0).toString(16);
  });
}

function serializeForURI(obj) {
  var str = [];
  for (var p in obj)
    if (obj.hasOwnProperty(p)) {
      str.push(
        fixedEncodeURIComponent(p) + "=" + fixedEncodeURIComponent(obj[p])
      );
    }
  return str.join("&");
}

var FC = FC || {};
FC.onLoad = function () {
  var toggleLinkText = "Shop";
  FC.client.on("ready.done", function () {
    console.log("something");
    var toggleLinkAvailable = false;
    var cartTab = $(".shoppingcart-fixed");
    if (FC.json.item_count == 0) {
      $("#customcart-cart").addClass("empty");
      $("#customcart-toggle-cart").addClass("empty");
    } else {
      if (cartTab.length) {
        cartTab.find("a span").text(FC.json.item_count);
        cartTab.show();
      }
      var toggleLink = $("#customcart-toggle-cart");
      if (toggleLink.length) {
        toggleLinkText = toggleLink.text();
        toggleLinkAvailable = true;
        toggleLink.text(toggleLinkText + " (" + FC.json.item_count + ")");
      }
    }
    if (cartTab.length) {
      cartTab.on("click", function () {
        FC.sidecart.show();
      });
    }

    $("#customcart-cart").show();

    // lead time message when ordering quantities beyond what's in stock
    var form = $("form.customcart-addtocart");
    if (form.length) {
      form.find('input[type="number"]').each(function () {
        var input = $(this);
        if (input.attr("name") != "qty") return true;
        input.on("input", function () {
          var input = $(this);
          var available = input.data("available");
          if (available != undefined) {
            var message = form.find(".customcart-stock-notification");
            if (!message.length) {
              var messageText = input.data("overageMessage");
              if (messageText == undefined || messageText == "")
                messageText =
                  "Order may be delayed for quantities beyond what's available";
              message = $(
                '<div class="customcart-stock-notification">' +
                  messageText +
                  "</div>"
              );
              form.append(message);
            }
            if (input.val() > available) {
              message.show();
            } else {
              message.hide();
            }
          }
        });
        return false;
      });
    }

    // Unbind queue on submit function
    form.off();

    form.on("submit", function (e) {
      var form = $(this);
      var item = {};
      var hasError = false;

      var itemCategory = form.find("input[name=category]").val();
      if (typeof itemCategory != "undefined") {
        var encCategory = form.find("input[name=enccategory]").val();
        if (typeof encCategory != "undefined") {
          item[encCategory] = itemCategory;
        } else {
          item.category = itemCategory;
        }
      }
      var itemName = form.find("input[name=itemname]").val();
      if (typeof itemName != "undefined") {
        var encItemName = form.find("input[name=encitemname]").val();
        if (typeof encItemName != "undefined") {
          item[encItemName] = itemName;
        } else {
          item.name = itemName;
        }
      }
      var itemCode = form.find("input[name=itemnr]").val();
      if (typeof itemCode != "undefined") {
        var encItemCode = form.find("input[name=encitemnr]").val();
        if (typeof encItemCode != "undefined") {
          item[encItemCode] = itemCode;
        } else {
          item.code = itemCode;
        }
      }
      var imageUrl = form.find("input[name=imageurl]").val();
      if (typeof imageUrl != "undefined") {
        var encImageUrl = form.find("input[name=encimageurl]").val();
        if (typeof encImageUrl != "undefined") {
          item[encImageUrl] = imageUrl;
        } else {
          item.image = imageUrl;
        }
      }
      var itemPrice = form.find("input[name=price]").val();
      if (typeof itemPrice != "undefined") {
        var encItemPrice = form.find("input[name=encprice]").val();
        if (typeof encItemPrice != "undefined") {
          item[encItemPrice] = itemPrice;
        } else {
          item.price = itemPrice;
        }
      }
      var itemUrl = form.find("input[name=itemurl]").val();
      if (typeof itemUrl != "undefined") {
        var encItemUrl = form.find("input[name=encitemurl]").val();
        if (typeof encItemUrl != "undefined") {
          item[encItemUrl] = itemUrl;
        } else {
          item.url = itemUrl;
        }
      }
      var itemWeight = form.find("input[name=weight]").val();
      if (typeof itemWeight != "undefined") {
        var encWeight = form.find("input[name=encweight]").val();
        if (typeof encWeight != "undefined") {
          item[encWeight] = itemWeight;
        } else {
          item.weight = itemWeight;
        }
      }
      var itemQuantity = form.find("input[name=qty]").val();
      if ($.isNumeric(itemQuantity)) {
        itemQuantity = Math.round(itemQuantity);
        if (itemQuantity <= 0) {
          itemQuantity = 1;
        }
      } else {
        itemQuantity = 1;
      }
      if (typeof itemQuantity != "undefined") {
        var encItemQuantity = form.find("input[name=encqty]").val();
        if (typeof encItemQuantity != "undefined") {
          item[encItemQuantity] = itemQuantity;
        } else {
          item.quantity = itemQuantity;
        }
      }
      var maxqty = form.find("input[name=maxqty]").val();
      if (typeof maxqty != "undefined") {
        var encMaxqty = form.find("input[name=encmaxqty]").val();
        if (typeof encMaxqty != "undefined") {
          item[encMaxqty] = maxqty;
        } else {
          item.quantity_max = maxqty;
        }
      }

      if (!hasError) {
        var notificationBox = form.find(".customcart-notification");
        if (notificationBox.length) {
          notificationBox
            .text("...")
            .removeClass("success error")
            .stop(true)
            .fadeIn("fast");
        }

        var uri = "https://" + FC.settings.storedomain + "/cart?";
        uri = uri + serializeForURI(item);
        FC.client.request(uri).done(function (dataJSON) {
          //console.log(dataJSON);
          if (toggleLinkAvailable) {
            $("#customcart-toggle-cart").text(
              toggleLinkText + " (" + FC.json.item_count + ")"
            );
          }
          $("#customcart-cart").removeClass("empty");
          if (notificationBox.length) {
            notificationBox
              .text("Item was added to cart")
              .removeClass("error")
              .addClass("success")
              .delay(3000)
              .fadeOut("slow");
          }
          $("#customcart-cart").addClass("expanded");
          var cartTab = $(".shoppingcart-fixed");
          if (cartTab.length) {
            cartTab.show();
            cartTab.find("a span").text(FC.json.item_count);
          }
          FC.sidecart.show();
        });
      } else {
        var notificationBox = form.find(".customcart-notification");
        if (notificationBox.length) {
          notificationBox
            .text("An Error Occurred")
            .removeClass("success")
            .addClass("error")
            .stop(true)
            .fadeIn("fast")
            .delay(3000)
            .fadeOut("slow");
        }
      }

      e.preventDefault();
      return false;
    });

    $(
      ".store-addtocart-option .loading-overlay, .pl-parts-detail-addtocart .loading-overlay"
    ).hide();

    var buttons = $(".customcart-add");
    buttons.each(function () {
      if ($(this).hasClass("queue-click")) {
        $(this).removeClass("queue-click");
        //$('.store-addtocart-option .loading-overlay, .pl-parts-detail-addtocart .loading-overlay').hide();
        $(this).closest("form").trigger("submit");
      }
    });

    $("#customcart-toggle-cart").on("click", function (e) {
      if ($(this).hasClass("empty") && $(this).attr("href") != "#") {
        // allow navigating to the link
        return true;
      }
      // show sidecart
      e.stopPropagation();
      //$('#customcart-cart').toggleClass('expanded');
      FC.sidecart.show();

      return false;
    });
  });
};

/*Object cart_cancel_and_continue_link: "http://192.168.1.200/buy-parts/AGCO-Part-71431758-LOCK-167158/"
cart_config_hash: "03831873435edc0ef44c82c0d060c5c7"
context: "cart"
coupons: Array[0]
custom_fields: Array[0]
expires_in: 0
future_coupons: Array[0]
future_subscription_totals_by_date: Array[0]
has_current_flat_rate_shipping: false
has_current_live_rate_shipping: false
has_eligible_coupons: false
has_future_flat_rate_shipping: false
has_future_live_rate_shipping: false
has_future_products: false
has_future_shipping: false
has_future_taxes: false
has_location_dependent_taxes: false
has_multiple_addresses: false
has_multiship: false
has_product_images: false
has_subscriptions: false
has_taxes: false
is_future_shipping_only: false
is_subscription_cancel: false
is_subscription_modification: false
is_updateinfo: false
item_count: 0
items: Array[0]
language: ""
loading_coupons: false
loading_quantity: false
loading_taxes: false
locale_code: "en_US"
locale_info: Object
messages: Object
multiship_data: Array[0]
order_payment_options: Array[0]
payment_info_required: false
session_id: "31gvnmba754voaqhpv5ued8v56"
session_name: "fcsid"
shipping_address: Object
shipping_and_handling_label: "Handling"
show_address_entry: false
show_amazon_fps_payment_option: false
show_coupon_input_button: false
show_future_subscriptions_details: false
show_multiship_details: false
show_paypal_express_payment_option: false
show_shipping_tbd: false
store_id: 42210
taxes_calculated: false
total_discount: 0
total_future_item_price: 0
total_future_shipping: 0
total_future_weight_shippable: 0
total_item_price: 0
total_order: 0
total_shipping: 0
total_tax: 0
total_weight: 0
total_weight_shippable: 0
transaction_id: 1137269774
weight_uom: null*/
