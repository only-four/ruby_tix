document.addEventListener('DOMContentLoaded', function(){

  select = document.querySelector('.current_user_account_name')

  select.addEventListener('change',function(){
    if(select.value === "2"){
      console.log('2');
      $(`.centre`).show();
      $(`.hold`).hide();
      $(`.record`).hide();
      $(`#member_centre`).on('click', function(){
        $(`.centre`).show();
      })
    }else if(select.value === "3"){
      console.log('3');
      $(`.record`).show();
      $(`.centre`).hide();
      $(`.hold`).hide();
      $(`#activity_record`).on('click', function(){
        $(`.record`).show();
      })
    }else if(select.value === "4"){
      console.log('4');
      $(`.hold`).show();
      $(`.centre`).hide();
      $(`.record`).hide();
      $(`#hold_activity`).on('click', function(){
        $(`.hold`).show();
      })
    }else if(select.value === "5"){
      console.log('4');
      $(`.cart`).show();
      $(`.centre`).hide();
      $(`.record`).hide();
      $(`.hold`).hide();
      $(`#shopping_cart`).on('click', function(){
        $(`.cart`).show();
        
      })

    }



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


