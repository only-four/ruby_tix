document.addEventListener("turbolinks:load", function(){
  const minusBtn = document.querySelectorAll('.js-minusTicket')
  const addBtn = document.querySelectorAll('.js-addTicket')
  const detailBtn = document.querySelectorAll('.js-cardLink')
  const ticketDetail = document.querySelector('.js-ticket-detail')

  minusBtn.forEach(function(evt){
    evt.addEventListener('click', function(e) {
      e.preventDefault();
      addTicket(-1, e.target);
    })
  })

  addBtn.forEach(function(evt){
    evt.addEventListener('click', function(e) {
      const quantity = e.target.previousSibling.previousElementSibling.textContent
      e.preventDefault();
      addTicket(1, e.target);
    })
  })

  // detailBtn.forEach(function(e){
  //   e.addEventListener('click', function(e){
  //     // e.target.previousSibling.textContent
  //     //console.log(e.target.parentNode.nextSibling.firstChild);
  //     // FIXME 處理點擊「更多資訊」沒有對應到相應位置的問題
  //     // ticketDetail = 
  //     ticketDetail.classList.toggle("hidden");
  //   })
  
    function addTicket(amount, node){
      var quantityField = node.parentNode.querySelector('.js-ticketQuantity');
      var quantity = parseInt(quantityField.innerHTML); 
      quantity = quantity + amount;
      // 設定quantity最小值為0
      if(quantity < 0 ){quantity = 0;}
      // 將quantity呈現在quantity
      quantityField.innerHTML = quantity;
    }
  })



