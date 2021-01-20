document.addEventListener("turbolinks:load", function(){
  
  
  
  const favBtn = document.querySelector('.js-fav-btn')
  const favValue = document.querySelector('.js-fav-btn').value

  
  favBtn.addEventListener("click", function(){
    console.log(favValue)
    const favAPI = window.location.origin
    // fetch(`${favAPI}/favorite`)
    // .then(response => response.json())
    fetch(`${favAPI}/favorite`, {
    method: 'POST', // or 'PUT'
    headers: new Headers({
      'Content-Type': 'application/json'
    })
  }).then(res => res.json())
  .catch(error => console.error('Error:', error))
  .then(response => console.log('Success:', response));
  })



  







  // const searchBtn = document.querySelector('.js-search-btn')
  // searchBtn.addEventListener('click', function(){
  //   // 取得輸入框的值
  //   const searchInput = document.querySelector('.js-search-input').value
  //   const searchAPI = window.location.origin
  //   // 如果是輸入匡的值是空的，就停在原地。
  //   if(searchInput == "") { return }
  //   // 如果yield不為空，就清空
  //   area = document.querySelector('.js-main-area')
  //   if(area.innerHTML != ""){
  //     area.innerHTML = ""
  //   }
  //   fetch(`${searchAPI}/pages/search.json?search=${searchInput}`)
  //   // response.json可將得到的結果轉換成json格式
  //   .then(response => response.json())
  //   .then(result => result.forEach(element => {       
  //     const areaDiv = document.createElement('div')
  //     const itemDiv = document.createElement('div')
  //     const imgDiv = document.createElement('img')
  //     const title = document.createElement('p')       
  //     // areaDiv.classList.add(...areaClassList)
  //     itemDiv.classList.add('t-item')
  //     imgDiv.classList.add('t-item-img')
  //     // 如果沒有活動圖，給一個預設圖
  //     if(element.image['url']){
  //       imgDiv.src = element.image['url']
  //     } else {
  //       imgDiv.src = "/images/rubytix006.png"
  //     }
  //     title.textContent = element.title       
  //     // 將找到的那筆資料 轉出來，增加到main area。                 
  //     itemDiv.appendChild(imgDiv)
  //     itemDiv.appendChild(title)
  //     areaDiv.appendChild(itemDiv)
  //     area.appendChild(areaDiv)
  //     })
  //   )
  // }) 
})
