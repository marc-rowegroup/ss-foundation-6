/*********************************************************************************************************/
/** Author: Tom Rowe and Associates                                                                     **/
/** Created by R.Pena                                                                                   **/
/** 11/10/2015                                                                                          **/
/** Used to send google analytics events upon element                                                   **/
/**  clicks and prolonged hovering.                                                                     **/
/*********************************************************************************************************/

// Usage:
//
// click class: ga-track-click
// click data attributes:
//      category    :   Set value to the google analytics event category you want to use
//      action      :   Set value to the google analytics event action you want to use
//      label       :   Set value to the google analytics event label you want to use
//      mobileclick :   No Value. Set this attribute if you only want to track the click
//                       on mobile devices. The test to determine whether the user is
//                         on mobile or not is the following media query:
//                           'only screen and (max-width: '+gaCHT_mobileWidthSpec+'px)'
//                         where gaCHT_mobileWidthSpec is a pixel size setting set below as:
//                           var gaCHT_mobileWidthSpec = 760;
//
//      phone       :   No Value. Set this attribute if element is a phone number.
//                       When this is set, category, action, and label become optional and
//                        default to the following values:
//                            category = 'Phone'
//                            action = 'Click'
//                            label = the text value of the element (usually the phone number)
//                       If category is set as anything other than 'Phone', a secondary event
//                        will also be sent under the category 'Phone'. This is to track total
//                        phone number clicks across the site.
//  Custom attributes:
//      plphone     :   No Value. Set this element if element is a phone number on the
//                       private label module. Very similar to the above setting.
//                      When this is set, category, action, and label are set to the following values:
//                           category = 'PLEquipment'
//                           action = 'Click'
//                           label = the text value of the element (usually the phone number)
//                      A secondary event will also be sent under the category 'Phone'. This is to
//                       track total phone number clicks across the site.
//
// hover class: ga-track-hover
// hover data attributes:
//      category   :   Set value to the google analytics event category you want to use
//      action     :   Set value to the google analytics event action you want to use
//      label      :   Set value to the google analytics event label you want to use
//      phone      :   No Value. Set this attribute if element is a phone number.
//                      When this is set, category, action, and label become optional and
//                       default to the following values:
//                           category = 'Phone'
//                           action = 'FocusedHover'
//                           label = the text value of the element (usually the phone number)
//                      If category is set as anything other than 'Phone', a secondary event
//                       will also be sent under the category 'Phone'. This is to track total
//                       phone number focus hovers across the site.
//  Custom attributes:
//      plphone    :   No Value. Set this element if element is a phone number on the
//                      private label module. Very similar to the above setting.
//                     When this is set, category, action, and label are set to the following values:
//                          category = 'PLEquipment'
//                          action = 'FocusedHover'
//                          label = the text value of the element (usually the phone number)
//                     A secondary event will also be sent under the category 'Phone'. This is to
//                      track total phone number focus hovers across the site.
//
//
// Apply the class/s and attributes to any element.
//  Can be a a/div/span... etc.
//
// Example:
// <a href="somelink" class="ga-track-click" data-category="somecategory" data-action="someaction" data-label="somelabel" data-plphone>555-555-5555</a>
// <a href="somelink" class="ga-track-click" data-category="somecategory" data-action="someaction" data-label="somelabel" data-mobileclick>555-555-5555</a>
// Example of hover and mobile click tracking of a phone number
// <a href="somelink" class="ga-track-hover ga-track-click" data-phone data-mobileclick>555-555-5555</a>
//
///////////////////////////////////////////////////////////////

var gaCHT_HoverTrackMap = {};
var gaCHT_ClickTrackMap = {};
var gaCHT_focusHoverLimit = 2500; // set prolonged hover event to trigger at 2.5 seconds
var gaCHT_Debug = false; // will not sent google analytics events when set to true
// mobile device width query setting
var gaCHT_mobileWidthSpec = 760;

function gaCHT_trackGoogleEvent(category, action, label) {
	if(typeof ga == 'undefined') {
		return 0;
	}
    if(gaCHT_Debug) {
        console.log('gaCHT - Google Track Event: '+category+' : '+action+' : '+label);
        return 0; // don't send google analytics event
    }
    return ga('send', {
        hitType: 'event',
        eventCategory: category,
        eventAction: action,
        eventLabel: label
    });
}

$(document).ready(function()
{
    $('.ga-track-hover').each(function() {
        var key = $.trim($(this).text());
		if(key != '') {
			var category = $(this).data('category');
			var action = $(this).data('action');
			var label = $(this).data('label');
			var isPhone = typeof $(this).data('phone') != 'undefined';
			var isPLPhone = typeof $(this).data('plphone') != 'undefined';
			if(isPLPhone) {
				isPhone = true;
				category = 'PLEquipment';
				action = 'FocusedHover';
				label = 'PL - '+key;
			} else if(isPhone) {
				if(typeof category == 'undefined') {
					category = 'Phone';
				}
				if(typeof action == 'undefined') {
					action = 'FocusedHover';
				}
				if(typeof label == 'undefined') {
					label = key;
				}
			}
			if(typeof category == 'undefined' || typeof action == 'undefined' || typeof label == 'undefined') {
				console.log('ga-track-hover item is missing required data attributes (category, action, label)');
			} else {
				gaCHT_HoverTrackMap[key] = {to:'', 'triggered':false};
				$(this).hover(function() {
					var key = $.trim($(this).text());
					if(!gaCHT_HoverTrackMap[key].triggered) {
						gaCHT_HoverTrackMap[key].to = setTimeout(function() {
							// hover not counted on mobile
							if(!window.matchMedia('only screen and (max-width: '+gaCHT_mobileWidthSpec+'px)').matches) {
								// mark as triggered
								gaCHT_HoverTrackMap[key].triggered = true;
								// if phone, send generic phone track event
								if(isPhone && category != 'Phone') {
									gaCHT_trackGoogleEvent('Phone', action, label);
								}
								gaCHT_trackGoogleEvent(category, action, label);
								if(gaCHT_Debug) {
									console.log('hovered on '+key);
								}
							}
						}, gaCHT_focusHoverLimit);
					}
				}, function() {
					var key = $.trim($(this).text());
					if(!gaCHT_HoverTrackMap[key].triggered) {
						clearTimeout(gaCHT_HoverTrackMap[key].to);
					}
				});
			}
		}
    });
    $('.ga-track-click').each(function() {
        var key = $.trim($(this).text());
		if(key != '') {
			var category = $(this).data('category');
			var action = $(this).data('action');
			var label = $(this).data('label');
			var mobileClickOnly = typeof $(this).data('mobileclick') != 'undefined';
			var isPhone = typeof $(this).data('phone') != 'undefined';
			var isPLPhone = typeof $(this).data('plphone') != 'undefined';
			if(isPLPhone) {
				isPhone = true;
				category = 'PLEquipment';
				action = mobileClickOnly ? 'MobileClick' : 'Click';
				label = 'PL - '+key;
			} else if(isPhone) {
				if(typeof category == 'undefined') {
					category = 'Phone';
				}
				if(typeof action == 'undefined') {
					action = mobileClickOnly ? 'MobileClick' : 'Click';
				}
				if(typeof label == 'undefined') {
					label = key;
				}
			}
			if(typeof category == 'undefined' || typeof action == 'undefined' || typeof label == 'undefined') {
				console.log('ga-track-click item is missing required data attributes (category, action, label)');
			} else {
				gaCHT_ClickTrackMap[key] = {'triggered':false};
				$(this).click(function() {
					if(!mobileClickOnly || window.matchMedia('only screen and (max-width: '+gaCHT_mobileWidthSpec+'px)').matches) {
						var key = $.trim($(this).text());
						if(!gaCHT_ClickTrackMap[key].triggered) {
							// mark as triggered
							gaCHT_ClickTrackMap[key].triggered = true;
							// if phone, send generic phone track event
							if(isPhone && category != 'Phone') {
								gaCHT_trackGoogleEvent('Phone', action, label);
							}
							gaCHT_trackGoogleEvent(category, action, label);
							if(gaCHT_Debug) {
								console.log('clicked on '+key);
							}
						}
					}
				});
			}
		}
    });
});