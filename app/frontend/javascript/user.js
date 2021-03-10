document.addEventListener("turbolinks:load", function(){
  const avator = document.querySelector('.js-user-avator')
  // debugger
  window.avator = avator;
  const userOption = document.querySelector('.js-user-option')

  const bell = document.querySelector('.js-bell-notify')
  const bellwin = document.querySelector('.js-bell-window')

  const categoryIcon = document.querySelector('.js-category-icon')
  const categoryOption = document.querySelector('.js-category-option')

    avator.addEventListener('blur', function(){
      console.log('!!4')
  })

  avator.addEventListener('click', function(){
      console.log('!!3')

    if(bellwin.classList.contains('hidden')){
    } else{
      bellwin.classList.toggle("hidden");
    }
    userOption.classList.toggle("hidden");
  })

  categoryIcon.addEventListener('click', function(){
    categoryOption.classList.toggle("hidden");
  })

  bell.addEventListener('click', function(){
    if(userOption.classList.contains('hidden')){
    } else{
      userOption.classList.toggle("hidden");
    }
    bellwin.classList.toggle("hidden");
  })
})