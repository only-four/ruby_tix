import { Controller } from "stimulus"
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = [ "icon" ]

  add(e) {
    e.preventDefault();
    const activityId = this.data.get('id')

    Rails.ajax({
      url: `/activities/${activityId}/favorite`,
      type: 'post',
      success: (resp) => {
        if (resp.status == "added") {
          this.iconTarget.classList.remove("far")
          this.iconTarget.classList.add("fas")
        } else {
          this.iconTarget.classList.remove("fas")
          this.iconTarget.classList.add("far")
        }
      },
      error: function(err) {
        console.log(err);
      }
    })
  }
}