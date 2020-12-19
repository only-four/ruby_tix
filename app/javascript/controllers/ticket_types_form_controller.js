import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "addBtn"]

  addTicketType(event) {
    event.preventDefault();
    
    let form = this.formTarget.innerHTML.replace(/NEW_FORM/g, new Date().getTime());
    this.addBtnTarget.insertAdjacentHTML('beforebegin', form);
    
    // console.log(form);
  }


}
