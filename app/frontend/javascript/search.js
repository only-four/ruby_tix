  document.addEventListener('DOMContentLoaded', function(){

    const searchBtn = document.querySelector('.search-btn')

    searchBtn.addEventListener('click', function() {
      const searchInput = document.querySelector('.search-input').value
      // 取得輸入框的值
      console.log(searchInput);

      const searchAPI = window.location.origin

      // 新增一個div
      // const div = document.createElement('div')
      // div.className = 'js-activity-item'

      // 如果是輸入匡的值是空的，就停在原地。
      if(searchInput == ""){ return }

      fetch(`${searchAPI}/pages/search.json?search=${searchInput}`)
      // response.json可將得到的結果轉換成json格式
      .then(response => response.json())
      .then(result => result.forEach(element => {
          console.log(element);
          const divClassList = ["mt-100", "bg-gray-200", "p-3", "group", "border-gray-500", "hover:bg-white",  "hover:shadow-lg", "hover:border-transparent"]
          const div = document.createElement('div')
          div.classList.add(...divClassList)

          
          div.textContent = element.title
          area = document.querySelector('.js-main-area')
          console.log(area)
          if(area.innerHTML != ""){
            area.innerHTML = ""
          }
          document.querySelector('.js-main-area').appendChild(div)
          
          // creatElement
        })
      )
      // 將找到的那筆資料 轉出來，增加到main area。
      // .then(document.querySelector('.js-main-area').appendChild(div))
        
    })
  
  })


  