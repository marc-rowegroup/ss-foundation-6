$(function() {

	var clickTriggerClass = 'trn-click-trigger'; // use this class when the trigger is a click on a dom element
	var otherTriggerClass = 'trn-trigger'; // use this class when the trigger is a custom function call
	var autoShowDisablerClass = 'trn-disable'; // for checkbox input
	var functCallDataAttr = 'call';
	var functCallUndoDataAttr = 'undo'; // used to set a "close" callback
	var timeoutDataAttr = 'tout';
	var defaultTimeout = '3000'; // milliseconds

	$('.'+autoShowDisablerClass).each(function() {
		var obj = $(this);
		// get trigger element which wraps disabler checkbox
		var triggerElem = obj.closest('.'+otherTriggerClass+', .'+clickTriggerClass);
		var triggerElemID;
		//console.log('processing disabler');
		if(triggerElem.length) { // must exist
			triggerElem = triggerElem.first();
			triggerElemID = triggerElem.attr('id');
			//console.log(triggerElemID);
			if(typeof triggerElemID != 'undefined') { // trigger elem must have an ID
				// check for cookie setting
				var cookieValue = document.cookie.match('(^|;) ?trn-set-' + triggerElemID + '=([^;]*)(;|$)');
				//console.log(cookieValue);
                cookieValue = cookieValue ? cookieValue[2] == 1 : false;
				if(cookieValue) {
					// disable auto trigger for this item
					triggerElem.addClass('trn-disabled');
					if(obj.is('input')) {
						obj.prop('checked', true);
					}
				} else {
					// user has not disabled this auto trigger
					if(obj.is('input')) {
						obj.prop('checked', false);
					}
				}
				var showAlways = obj.data('showAlways');
				if(showAlways == undefined) {
					showAlways = false;
				}
				if(!showAlways) {
					// hide obj by hiding its parent
					obj.parent().hide();
				}
				if(obj.is('input'))
				{
					// add on change event to disabler checkbox
					obj.change(function(e) {
						var expires = new Date();
						expires.setTime(expires.getTime() + (365 * 24 * 60 * 60 * 1000));
						if($(this).is(":checked")) {
							document.cookie = 'trn-set-' + triggerElemID + '=1;expires=' + expires.toUTCString() + ';path=/;';
							triggerElem.addClass('trn-disabled');
							if(!showAlways) {
								// hide checkbox after two seconds
								setTimeout(function() {
									obj.parent().hide();
								}, 2000);
							}
						} else {
							document.cookie = 'trn-set-' + triggerElemID + '=0;expires=' + expires.toUTCString() + ';path=/;';
							triggerElem.removeClass('trn-disabled');
						}
					});
				}
				else
				{
					// add on click event to disabler link
					obj.on('click', function(e) {
						var expires = new Date();
						expires.setTime(expires.getTime() + (365 * 24 * 60 * 60 * 1000));
						document.cookie = 'trn-set-' + triggerElemID + '=1;expires=' + expires.toUTCString() + ';path=/;';
						triggerElem.addClass('trn-disabled');
						var autohide = obj.data('autohide');
						if(autohide != undefined && autohide) {
							var functToCall = obj.data(functCallUndoDataAttr);
							if(functToCall != '' && eval("typeof " + functToCall) != 'undefined') {
								eval(functToCall+"()");
							} else {
								// click the trigger, if any
								triggerElem.find('.trn-click').click();
							}
						}
						if(!showAlways) {
							// hide link after two seconds
							setTimeout(function() {
								obj.parent().hide();
							}, 2000);
						}
						return false;
					});
				}
			}
		}
	});

	$('.'+otherTriggerClass).each(function() {
		var obj = $(this);
		var elemID = obj.attr('id');
		var functToCall = obj.data(functCallDataAttr);
		var timeToWait = obj.data(timeoutDataAttr);
		if(typeof timeToWait == 'undefined') {
			timeToWait = defaultTimeout;
		}
		if(typeof elemID != 'undefined' && !obj.hasClass('trn-disabled')) {
			if(functToCall != '' && eval("typeof " + functToCall) != 'undefined') {
				if(!obj.hasClass('trn-disabled')) {
					toObj = setTimeout(function() {
						if(!obj.hasClass('trn-disabled'))
						{
							// show disabler checkbox
							obj.find('.'+autoShowDisablerClass).parent().show();
							// call user function
							eval(functToCall+"()");
							// disable after show
							obj.addClass('trn-disabled');
						}
					}, timeToWait);
				}
			}
		}
	});

	$('.'+clickTriggerClass).each(function() {
		var obj = $(this);
		var elemID = obj.attr('id');
		if(typeof elemID != 'undefined' && !obj.hasClass('trn-disabled') && obj.find('.trn-click').length) {
			var timeToWait = obj.data(timeoutDataAttr);
			if(typeof timeToWait == 'undefined') {
				timeToWait = defaultTimeout;
			}
			//console.log(elemID+ ' Adding autoshow timeout');
			toObj = setTimeout(function() {
				if(!obj.hasClass('trn-disabled')) {
					// show disabler checkbox
					obj.find('.'+autoShowDisablerClass).parent().show();
					// click the trigger
					obj.find('.trn-click').click();
					// disable after show
					obj.addClass('trn-disabled');
				}
			}, timeToWait);
		}
	});
	
});