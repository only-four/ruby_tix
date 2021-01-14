document.addEventListener("turbolinks:load", function(){
  const avator = document.querySelector('.js-user-avator')
  const option = document.querySelector('.js-user-option')

  const bell = document.querySelector('.js-bell-notify')
  const bellwin = document.querySelector('.js-bell-window')

  avator.addEventListener('click', function(){
    if(bellwin.classList.contains('hidden')){
    } else{
      bellwin.classList.toggle("hidden");
    }
    option.classList.toggle("hidden");
  })

  bell.addEventListener('click', function(){
    if(option.classList.contains('hidden')){
    } else{
      option.classList.toggle("hidden");
    }
    bellwin.classList.toggle("hidden");
  })
})
