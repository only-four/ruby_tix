document.addEventListener('DOMContentLoaded', function(){

  const minusBtn = document.querySelectorAll('.js-minusTicket')
  const addBtn = document.querySelectorAll('.js-addTicket')
  const detailBtn = document.querySelectorAll('.js-cardLink')
  const ticketDetail = document.querySelector('.js-ticket-detail')

  minusBtn.forEach(function(evt){
    evt.addEventListener('click', function(e) {
      console.log(e.target.nextSibling);
      e.preventDefault();
      addTicket(-1);
    })
  })

  addBtn.forEach(function(evt){
    evt.addEventListener('click', function(e) {
      const quantity = e.target.previousSibling.previousElementSibling.textContent
      e.preventDefault();
      addTicket(1);
    })
  })

  detailBtn.forEach(function(e){
    e.addEventListener('click', function(e){

      // e.target.previousSibling.textContent
      console.log(e.target.parentNode.nextSibling.firstChild);
      ticketDetail.classList.toggle("hidden");
    })
  })



  
  function addTicket(amount){
    // 抓到數量0
    var quantityField = document.querySelector('.js-ticketQuantity');

    // 把quantity定義為：改變元素裡的值，並轉化為數字的行為。
    var quantity = parseInt(quantityField.innerHTML); 
    quantity = quantity + amount;
    // 也可寫成quantity += amount;
    // 設定quantity最小值為0
    if(quantity < 0 ){quantity = 0;}
    // 將quantity呈現在quantity
    quantityField.innerHTML = quantity;
  }

})

