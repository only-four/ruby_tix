document.addEventListener('DOMContentLoaded', function(){

  const chatBtn = document.querySelector('.js-chat-btn')
  const chatBox = document.querySelector('.js-chatbox')
  const closeBtn = document.querySelector('.js-close-btn')

  chatBtn.addEventListener('click', function(){
    console.log('aaa')
    chatBox.classList.toggle("hidden");
  })

  closeBtn.addEventListener('click', function(){
    console.log('bbb')
    chatBox.classList.toggle("hidden");
  })
})