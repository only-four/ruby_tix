document.addEventListener("turbolinks:load", function(){

  const favBtn = document.querySelector('#js-fav-btn')
  // const favValue = document.querySelector('.js-fav-btn').value

  if(favBtn){
  favBtn.addEventListener("click", function(e){
    e.preventDefault();

    const axios = require('axios');
    const activityId = e.currentTarget.dataset.id;

    const token = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token

    axios.post(`/activities/${activityId}/favorite`, {})
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    });
    console.log(e.currentTarget.dataset.id)


  })
  }

})
