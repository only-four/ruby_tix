document.addEventListener("turbolinks:load", function(){
  const avator = document.querySelector('.js-user-avator')
  const userOption = document.querySelector('.js-user-option')
  const categoryIcon = document.querySelector('.js-category-icon')
  const categoryOption = document.querySelector('.js-category-option')



  

  avator.addEventListener('click', function(){
    userOption.classList.toggle("hidden");
  })

  categoryIcon.addEventListener('click', function(){
    categoryOption.classList.toggle("hidden");
  })
})
