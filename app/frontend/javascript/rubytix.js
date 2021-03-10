document.addEventListener("turbolinks:load", function(){
  let https = document.querySelector('.js-https')
  https.innerText = window.location.href;
})