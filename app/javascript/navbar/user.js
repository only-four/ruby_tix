document.addEventListener('DOMContentLoaded', function(){

  select = document.querySelector('.current_user_account_name')

  select.addEventListener('change',function(){
    if(select.value == "2"){
      console.log('aaaaaaaaaa');
      window.location.href = '/users/edit';
    }else if(select.value == "5"){
      console.log('hihihihhi');
      $(`.hold`).show();
      $(`#hold_activity`).click(function(){
        $(`.hold`).show();
      })
    }
  })
})



// var hold = document.getElementById("hold_activity"); 
// var toggle_hold = function() {  
//   document.getElementById("hold_activity").style.display="block"; 
// } 
// hold.onclick = toggle_hold;


