document.addEventListener("turbolinks:load", function(){
  const checkboxs = document.querySelectorAll('.js-checkbox')
  const act_begin_date = document.getElementById('activity_begin_datetime')
  const act_end_date = document.querySelector('.js-act_end_date')
  const act_begin_hr = document.getElementById('activity_begin_datetime_4i')
  const act_begin_min = document.getElementById('activity_begin_datetime_5i')
  const act_end_hr = document.getElementById('activity_finish_datetime_4i')
  const act_end_min = document.getElementById('activity_finish_datetime_5i')

  const ticket_begin_date1 = document.getElementById('activity_ticket_types_attributes_0_valid_at')
  const ticket_begin_hr1 = document.getElementById('activity_ticket_types_attributes_0_valid_at_4i')
  const ticket_begin_min1 = document.getElementById('activity_ticket_types_attributes_0_valid_at_5i')
  const ticket_end_date1 = document.getElementById('activity_ticket_types_attributes_0_expire_at')
  const ticket_end_hr1 = document.getElementById('activity_ticket_types_attributes_0_expire_at_4i')
  const ticket_end_min1 = document.getElementById('activity_ticket_types_attributes_0_expire_at_5i')
  const ticket_begin_date2 = document.getElementById('activity_ticket_types_attributes_1_valid_at')
  const ticket_begin_hr2 = document.getElementById('activity_ticket_types_attributes_1_valid_at_4i')
  const ticket_begin_min2 = document.getElementById('activity_ticket_types_attributes_1_valid_at_5i')
  const ticket_end_date2 = document.getElementById('activity_ticket_types_attributes_1_expire_at')
  const ticket_end_hr2 = document.getElementById('activity_ticket_types_attributes_1_expire_at_4i')
  const ticket_end_min2 = document.getElementById('activity_ticket_types_attributes_1_expire_at_5i')  

  for (i = 0; i < 2; i++) {
  checkboxs[i].addEventListener('click', function(){
    abd = act_begin_date.value
    aed = act_end_date.value
    abh = act_begin_hr.value
    abm = act_begin_min.value
    aeh = act_end_hr.value
    aem = act_end_min.value
    ticket_begin_date1.value = abd
    ticket_begin_date2.value = abd
    ticket_end_date1.value = aed
    ticket_end_date2.value = aed
    ticket_begin_hr1.value = abh
    ticket_begin_hr2.value = abh
    ticket_begin_min1.value = abm
    ticket_begin_min2.value = abm
    ticket_end_hr1.value = aeh
    ticket_end_hr2.value = aeh
    ticket_end_min1.value = aem
    ticket_end_min2.value = aem
  })
  }
})





