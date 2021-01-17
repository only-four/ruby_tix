import Rails from '@rails/ujs';
document.addEventListener('DOMContentLoaded', function() {
  const unattands = document.querySelectorAll('.js-unattand')
  unattands.forEach(function(unattand) {
    unattand.addEventListener('click', function(){
      console.log(unattand.dataset.id)  
      let unAttandData = unattand.dataset.id
      
      Rails.ajax({
        url: "/qr_codes/manual_attand",
        type: "post",
        data: `unAttandData=${unAttandData}`,
        success: function(data) {
          
        },
        error: function(data) {}
      }) 
    })    
  })
})