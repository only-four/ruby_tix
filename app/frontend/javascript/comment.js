document.addEventListener('DOMContentLoaded', function(){
  // 更新頁面
  const cBtn = document.querySelector('.js-commentBtn')
  cBtn.addEventListener('click', function(){
    location.reload();
  }) //reload 也許可改 appendChild
  // 刪除按鈕
  const removeBtn = document.querySelector('.js-removeBtn')
  const commentBox= document.querySelector('#js-commentBoxx')
  removeBtn.addEventListener('click',function(){
    commentBox.remove();
    location.reload();    
  })

})