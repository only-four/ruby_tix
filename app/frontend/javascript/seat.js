import Rails from '@rails/ujs';
document.addEventListener("DOMContentLoaded", function () {
  let seats = document.querySelectorAll('.js-seat:not(.sold)')
  let row = document.querySelector('.js-row')
  let current_count = document.querySelector('.js-seat-count')
  row.addEventListener('click', e => {
    if (
      e.target.classList.contains('js-seat') && !e.target.classList.contains('sold')
    ) {
      e.target.classList.toggle('select')
      console.log(e.toElement.dataset.id);
      // let current_seat_id = e.toElement.dataset.id
      // Rails.ajax({
      //   url: "/seats/`${e.toElement.dataset.id}`",
      //   type: "put",
      //   data: `current_seat_id=${current_seat_id}`,
      //   success: function(data) {
          
      //   },
      //   error: function(data) {}
      // }) 
      let seatsTaken= document.querySelectorAll('.js-seat.select')
      current_count.innerText = seatsTaken.length
      console.log(seatsTaken.length);
    }
  })
})