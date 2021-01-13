document.addEventListener("turbolinks:load", function(){
  const avator = document.querySelector('.js-user-avator')
  const option = document.querySelector('.js-user-option')

  const bell = document.querySelector('.js-bell-notify')
  const bellwin = document.querySelector('.js-bell-window')

  avator.addEventListener('click', function(){
    option.classList.toggle("hidden");
  })

  bell.addEventListener('click', function(){
    // console.log(bellwin)
    bellwin.classList.toggle("hidden");
  })
})
