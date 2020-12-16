console.log('hi')

document.addEventListener('DOMContentLoaded', function(){
  select = document.querySelector('.current_user_account_name')
  select.addEventListener('change',function(){
    if(select.value == "2"){
      console.log('aaaaaaaaaa');
      window.location.href = '/users/edit';
    }
  })
})


// document.getElementById('log_in').addEventListener('click', function(
//   console.log('hi')
// )}