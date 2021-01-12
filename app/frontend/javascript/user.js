document.addEventListener("turbolinks:load", function(){
  const avator = document.querySelector('.js-user-avator')
  const option = document.querySelector('.js-user-option')

  avator.addEventListener('click', function(){
    option.classList.toggle("hidden");
  })
})
