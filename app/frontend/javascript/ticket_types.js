document.addEventListener('DOMContentLoaded', function(){

  const minusBtn = document.querySelector('.js-minusTicket')
  const addBtn = document.querySelector('.js-addTicket')
  const detailBtn = document.querySelector('.js-cardLink')



  minusBtn.addEventListener('click', function(e) {
    console.log('-1');
    e.preventDefault();
    addTicket(-1);
  })

  addBtn.addEventListener('click', function(e) {
    console.log('+1');
    e.preventDefault();
    addTicket(1);
  })

  detailBtn.addEventListener('click', function(){
    console.log('add ticket detail info');
    $(`#ticket-detail`).show();
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