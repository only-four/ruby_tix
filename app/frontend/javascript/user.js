document.addEventListener('DOMContentLoaded', function(){

  const avator = document.querySelector('.js-user-avator')
  const option = document.querySelector('.js-user-option')

  avator.addEventListener('click', function(){
    console.log('aaa')
    option.classList.toggle("hidden");
  })


})



    // if(select.value == "2"){
    //   console.log('2');
    //   window.location.href = '/users/edit';
    // }

// var hold = document.getElementById("hold_activity"); 
// var toggle_hold = function() {  
//   document.getElementById("hold_activity").style.display="block"; 
// } 
// hold.onclick = toggle_hold;

  // const chatBtn = document.querySelector('.js-chat-btn')
  // const chatBox = document.querySelector('.js-chatbox')
  // const closeBtn = document.querySelector('.js-close-btn')

  // chatBtn.addEventListener('click', function(){
  //   console.log('aaa')
  //   chatBox.classList.toggle("hidden");

  // select = document.querySelector('.current_user_account_name')

  // select.addEventListener('change',function(){
  //   if(select.value === "2"){
  //     console.log('2');
  //     window.location.href = '/users/edit';
  //   }else if(select.value === "3"){
  //     console.log('3');
  //     window.location.href = '/tickets/my_tickets';
  //   }else if(select.value === "4"){
  //     console.log('4');
  //     window.location.href = '/orders';
  //   }else if(select.value === "5"){
  //     console.log('4');
  //     window.location.href = '/activities';
  //   }
  // })
