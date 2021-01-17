import Rails from '@rails/ujs';
document.addEventListener("DOMContentLoaded", function () {
  let seats = document.querySelectorAll('.js-seat:not(.sold)')
  let row = document.querySelector('.js-row')
  let current_count = document.querySelector('.js-seat-count')
  let totalSeatsCount = document.querySelector('.js-all-seats').dataset.id  
  row.addEventListener('click', e => {
    if (
      e.target.classList.contains('js-seat') && !e.target.classList.contains('sold')
    ) {
      e.target.classList.toggle('select')
      console.log(e.toElement.dataset.seat);
      console.log(e.toElement.dataset.id);
      let current_seat_id = e.toElement.dataset.id
      let current_seat = e.toElement.dataset.seat
      console.log(current_seat_id);
      // console.log(current_seat_seat);
      let data = new FormData()
      data.append("seat_number", `${current_seat}`)
      data.append("seat_id", `${current_seat_id}`)
      Rails.ajax({
        url: "/seats/`${current_seat_id}`",
        type: "put",
        data: data,
        success: function(resp) {
          // console.log(current_seat_id);
        },
        error: function(data) {}
      }) 
      let seatsTaken= document.querySelectorAll('.js-seat.select').length
      let seatLeft= document.querySelector('.js-seat-left')
      seatLeft.innerText = Number(totalSeatsCount) - Number(seatsTaken)
      current_count.innerText = seatsTaken
    }
  })
  // console.log(totalSeatsCount);
})