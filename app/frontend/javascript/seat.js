document.addEventListener("click", function () {
  let seats = document.querySelectorAll('.js-seat:not(.sold)')
  let row = document.querySelector('.js-row')
  row.addEventListener('click', e => {
    if (
      e.target.classList.contains('js-seat') && !e.target.classList.contains('sold')
    ) {
      e.target.classList.toggle('select')
    }
  })
})