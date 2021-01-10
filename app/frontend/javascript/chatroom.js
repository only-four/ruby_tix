$(document).on('turbolinks:load', function() {
  $('#new_message').on('keydown', function(e) {
    if (e.keyCode == 13) {
      e.preventDefault
      e.currentTarget.submit()
    }
  })
})