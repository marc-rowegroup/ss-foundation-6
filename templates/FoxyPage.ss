<!DOCTYPE html>
<html lang="$ContentLocale">
	<% include DocumentHeader %>
	<body class="$ClassName $URLSegment">
	$SiteConfig.TagManagerBody.RAW
			<div class="site-background site-height slicknav-wrapper">
				<% include MobileNav %>
				<% include Header %>
				<% include Navigation %>
				<% include MobileCallButton %>
				<% include Success %>
					<div class="row collapse">
						<div class="small-12 column">
							<%-- 	The .row.collapse above gives us full-width while
									half-wrap-outer (left and right half gutters) below gives us
									a full gutter against the next uncollapsed row columns
									created here by the BuildLeftSideBar and BuildRightSideBar includes
									from inside the layout-level template.

									This creates a full-width layout with even gutters throughout
									for the basic responsive left sidebar, main content, right sidbar "shell".
							--%>
							<div class="main stretch-to-site-height">
								<div class="mixed-row padding-top padding-bottom">
									<% include BrowseAllButton %>
									$Layout
								</div>
							</div>
						</div>
					</div>
				<% include Footer %>
				<% include SlideOut %>
			</div>

	<script src="{$ThemeDir}/javascript/thirdparty/jquery.clearfield.js"></script>
	<script src="{$ThemeDir}/javascript/thirdparty/jquery.slicknav.js"></script>
	<script src="{$ThemeDir}/javascript/thirdparty/jquery.flexslider.js"></script>
	<script src="{$ThemeDir}/javascript/google.click-hover-tracking.js"></script>
	<script src="{$ThemeDir}/javascript/TimedTrigger.js"></script>
	<script src="{$ThemeDir}/javascript/thirdparty/jquery.tabSlideOut.v1.3.js"></script>
	<% if UseCartIntegration %>
		<!-- FOXYCART -->
		<script src="//cdn.foxycart.com/loweandyoung.secure.clicknvend.com/loader.js" async defer></script>
		<!-- FOXYCART -->
	<% end_if %>

	<%-- Convert REM units to PX in ie8 --%>
	<% if HideBadRemFile %>
	<% else %>
	<!--[if IE 8]>
		<script src="{$ThemeDir}/javascript/thirdparty/rem.js"></script>
	<![endif]-->
	<% end_if %>

	<script> // Just getting some functions ready

         $(function(){
             $('.slide-out-div').tabSlideOut({
                 tabHandle: '.handle',                              //class of the element that will be your tab
                 pathToTabImage: 'themes/silverstripe-foundation/images/btn_contact_green.png',          //path to the image for the tab (optionaly can be set using css) OPTIONAL TAGS WITH DIFFERENT COLORS
                 imageHeight: '181px',                               //height of tab image
                 imageWidth: '52px',                               //width of tab image
                 tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
                 speed: 300,                                        //speed of animation
                 action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
                 topPos: '28%',                                   //position from the top
                 fixedPosition: true                               //options: true makes it stick(fixed position) on scroll
             });
             $('.slide-out-div-mobile').tabSlideOut({
                 tabHandle: '.handlemobile',                              //class of the element that will be your tab
                 //pathToTabImage: 'themes/responsive/images/btn_contact.png',          //path to the image for the tab (optionaly can be set using css)
                 //imageHeight: '181px',                               //height of tab image
                 //imageWidth: '52px',                               //width of tab image
                 tabLocation: 'bottom',                               //side of screen where tab lives, top, right, bottom, or left
                 speed: 300,                                        //speed of animation
                 action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
                 //topPos: '100%',                                   //position from the top
                 leftPos: '0px',
                 fixedPosition: true                               //options: true makes it stick(fixed position) on scroll
             });

         });
		// Set minimum site height according to current window size
		function setSiteHeight() {
			$('.stretch-to-site-height').css('min-height',0);

			var currentDeviceHeight = $(window).height();
			var currentSiteHeight = $('.site-height').outerHeight();
			var currentContentHeight = $('.stretch-to-site-height').outerHeight();

			if (currentDeviceHeight > currentSiteHeight) {
				var nonContentHeight = currentSiteHeight - currentContentHeight;
				var newContentHeight = currentDeviceHeight - nonContentHeight;
				$('.stretch-to-site-height').css('min-height',newContentHeight);
			}
		}

		// refire setSiteHeight for dynamically height-adjusted components
		$( ".jquery-ui-tabs ul.tabs li a" ).click(function() { setTimeout(setSiteHeight,1);	});

	</script>

	<script> // Run these scripts on Document Ready

		$(function(){
				$("#clickme").toggle(function () {
			        $(this).parent().animate({right:'0px'}, {queue: false, duration: 500});
			    }, function () {
			        $(this).parent().animate({right:'-175px'}, {queue: false, duration: 500});
			    });
		        $(window).scroll(function () {
		            if ($(this).scrollTop() > 50) {
		                $('#uparrow').fadeIn();
		            } else {
		                $('#uparrow').fadeOut();
		            }
		        });
		        // scroll body to 0px on click
		        $('#uparrow').click(function () {
		            $('body,html').animate({
		                scrollTop: 0
		            }, 800);
		            return false;
		        });

			// Run slicknav mobile menu and append the home icon
			$('#mobile-menu').slicknav({ prependTo: '.slicknav-wrapper' });
			$('.slicknav_menu').prepend('<a class="slicknav_home" href=""><img src="{$ThemeDir}/images/icon-home.png" width="35" height="35"></a>');

			// make a ul of images a slider by wrapping it in a div with the following class - https://github.com/woothemes/FlexSlider
			$('.flexslide').flexslider({ animation: "slide" });

			// add to <select> to send the browser to another page from that drop-down of url's
			$('.url-select').change(function () { window.location = $(this).val(); });

			// set minimum site height on load
			setSiteHeight();

			// these functions refire on window resize, but not before document ready
			$( window ).resize(function() {
  				setSiteHeight();
			});

			$('#SearchFrom_EquipmentSearch_random').clearField();
			$('#SearchFrom_EquipmentSearch_action_Submit').click(function(e){e.preventDefault();RedirectToSearch();});

			$('input#SearchFrom_EquipmentSearch_random').keypress(function (e) {
				if (e.keyCode == '13') {
					e.preventDefault();
					RedirectToSearch();
				}
			});

			function RedirectToSearch()
			{
				var query = $('input#SearchFrom_EquipmentSearch_random').val();
				window.location.href = '/search-used-equipment-for/' + encodeURIComponent(query);
			}

			$('#SearchFrom_EquipmentSearchtwo_random').clearField();

			$('#SearchFrom_EquipmentSearchtwo_action_Submit').click(function(e){e.preventDefault();RedirectToSearchtwo();});

			$('input#SearchFrom_EquipmentSearchtwo_random').keypress(function (e) {
				if (e.keyCode == '13') {
					e.preventDefault();
					RedirectToSearchtwo();
				}
			});

			function RedirectToSearchtwo()
			{
				var query = $('input#SearchFrom_EquipmentSearchtwo_random').val();
				window.location.href = '/search-used-equipment-for/' + encodeURIComponent(query);
			}

			var id = '#dialog';

			//Get the window height and width
			var winH = $(window).height();
			var winW = $(window).width();

			//Set the popup window to center
			$(id).css('top',  winH/2-$(id).height()/2);
			$(id).css('left', winW/2-$(id).width()/2);

			//transition effect
			$(id).fadeIn(0);

			//fade out after delay
			$('.window').delay(4000).fadeOut(1000);

			//if close button is clicked
			$('.window .close').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();

			$('.window').hide();
			});
		});

	</script>

	<%-- stop nivoslider module from loading it's own version of jQuery --%>
	<% require block("silverstripe-nivoslider/javascript/jquery-1.9.0.min.js") %>

	</body>
</html>
