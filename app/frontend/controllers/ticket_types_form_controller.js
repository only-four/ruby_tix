import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "addBtn"]

  addTicketType(event) {
    event.preventDefault();
    
    let form = this.formTarget.innerHTML.replace(/NEW_FORM/g, new Date().getTime());
    this.addBtnTarget.insertAdjacentHTML('beforebegin', form);
  }

  removeTicketType(event){
    event.preventDefault();
    let ticket_type = event.target.closest('.ticketType-form');
    if (ticket_type.dataset.newRecord == 'true') {
      ticket_type.remove();
    } else {
      ticket_type.querySelector("input[name*='_destroy]").value = 1;
      ticket_type.style.display = 'none';
    }
  }


}
