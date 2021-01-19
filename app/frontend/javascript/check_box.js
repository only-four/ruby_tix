document.addEventListener('turbolinks:load', function(){
  const actbegindate = document.querySelector('.js-activity_begindate')
  const actbegintime = document.querySelector('.js-activity_begintime')
  const actenddate = document.querySelector('.js-activity_enddate')
  const actendtime = document.querySelector('.js-activity_endtime')

  var checkboxs = document.querySelectorAll('.js-check_box_ticket_type')
  for(var i=0; i < checkboxs.length ; i++){
  
  checkboxs[i].addEventListener('click', function(){
    for(var i=0; i < checkboxs.length ; i++){
      var ticketbegindate = document.querySelectorAll('.js-ticket_begindate')
      var ticketbegintime = document.querySelectorAll('.js-ticket_begintime')
      var ticketenddate = document.querySelectorAll('.js-ticket_enddate')
      var ticketendtime = document.querySelectorAll('.js-ticket_endtime')

      activity_begin_date = actbegindate.value
      ticketbegindate[i].value = activity_begin_date
  
      activity_begin_time = actbegintime.value
      ticketbegintime[i].value = activity_begin_time
  
      activity_end_date = actenddate.value
      ticketenddate[i].value = activity_end_date
  
      activity_end_time = actendtime.value
      ticketendtime[i].value = activity_end_time
    }
  })
}
})