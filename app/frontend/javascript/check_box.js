document.addEventListener('turbolinks:load', function(){
  const actbegindate = document.querySelector('.js-activity_begindate')
  const actbegintime_hr = document.getElementById('activity_begin_datetime_4i')
  const actbegintime_min = document.getElementById('activity_finish_datetime_5i')
  const actenddate = document.querySelector('.js-activity_enddate')
  const actendtime_hr = document.getElementById('activity_finish_datetime_4i')
  const actendtime_min = document.getElementById('activity_finish_datetime_5i')

  var checkboxs = document.querySelectorAll('.js-check_box_ticket_type')
  for(var i=0; i < checkboxs.length ; i++){
  
  checkboxs[i].addEventListener('click', function(){
    console.log('test')
    for(var i=0; i < checkboxs.length ; i++){
      var ticketbegindate = document.querySelector('.js-ticket_begindate')
      var ticketbegintime_hr = document.getElementById('activity_ticket_types_attributes_0_valid_at_4i')
      var ticketbegintime_min = document.getElementById('activity_ticket_types_attributes_0_valid_at_5i')
      var ticketenddate = document.querySelectorAll('.js-ticket_enddate')
      var ticketendtime_hr = document.getElementById('activity_ticket_types_attributes_0_expire_at_4i')
      var ticketendtime_min = document.getElementById('activity_ticket_types_attributes_0_expire_at_5i')

      activity_begin_date = actbegindate.value
      ticketbegindate[i].value = activity_begin_date
  
      activity_begin_time = actbegintime_hr.value
      ticketbegintime_hr.value = activity_begin_time
  
      activity_end_date = actbegintime_min.value
      ticketbegintime_min.value = activity_end_date
  
      activity_end_date = actenddate.value
      ticketenddate[i].value = activity_end_date
  
      activity_end_time = actendtime_hr.value
      ticketendtime_hr.value = activity_end_time
  
      activity_end_date = actendtime_min.value
      ticketendtime_min.value = activity_end_date
    }
  })
}
})