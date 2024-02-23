$(document).foundation()

AOS.init({
  useClassNames: true,
	disable: 'mobile', // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
});

// SlideOuts
document.addEventListener("DOMContentLoaded", function () {
  const slideButtons = document.querySelectorAll(".slide-out-btn");
  const menuBgOverlay = document.querySelector(".menu-bg-overlay");

  function openSlideOut(slideOutId) {
      const slideOutElement = document.getElementById(slideOutId);
      slideOutElement.style.right = "0";
      menuBgOverlay.style.display = "block";
  }

  function closeSlideOut(slideOutId) {
      const slideOutElement = document.getElementById(slideOutId);
      slideOutElement.style.right = "-100%"; /* Slide it back off-screen */
      menuBgOverlay.style.display = "none";
  }

  // Event listeners for button clicks
  slideButtons.forEach((button) => {
      const targetId = button.getAttribute("id").replace("slideMenu", "SlideOut");
      button.addEventListener("click", () => {
          openSlideOut(targetId);
      });
  });

  // Close button click event
  const closeButtons = document.querySelectorAll(".menu-close-btn");
  closeButtons.forEach((btn) => {
      btn.addEventListener("click", () => {
          slideButtons.forEach((button) => {
              const targetId = button.getAttribute("id").replace("slideMenu", "SlideOut");
              closeSlideOut(targetId);
          });
      });
  });

  // Close slide-out when clicking on the overlay
  menuBgOverlay.addEventListener("click", () => {
      slideButtons.forEach((button) => {
          const targetId = button.getAttribute("id").replace("slideMenu", "SlideOut");
          closeSlideOut(targetId);
      });
  });
});

$(document).on('ready', function() {
    $(".slide-count").slick({
        dots: true,
        infinite: true,
        autoplay: false,
        centerMode: true,
        centerPadding: '40px',
        lazyLoad: 'ondemand',
        prevArrow: $(".prev-arrow"),
        nextArrow: $(".next-arrow"),
        appendArrows: '.counter-container',
        dotsClass: 'counter',
        appendDots: '.counter-container',
        customPaging: function(slider, i) {
            var currentSlide = i + 1;
            var totalSlides = slider.slideCount;
            return '<a class="slick-dot">' + currentSlide + ' of ' + totalSlides + '</a>';
        },
        slidesToShow: 3,
        slidesToScroll: 1,
        responsive: [{
                breakpoint: 1024,
                settings: {
                    arrows: false,
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    arrows: false,
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
          
        ]
    });
});