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

