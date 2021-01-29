document.addEventListener("turbolinks:load", function () {
  //Get the button:
  topbutton = document.getElementById("topBtn");

  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function () {
    scrollFunction();
  };

  function scrollFunction() {
    if (
      document.body.scrollTop > 20 ||
      document.documentElement.scrollTop > 20
    ) {
      topbutton.style.display = "block";
    } else {
      topbutton.style.display = "none";
    }
  }

  topbutton.addEventListener("click", function () {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
  });
});
