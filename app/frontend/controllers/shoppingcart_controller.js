import { Controller } from "stimulus"
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ["count", "hidden"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
  addcart(){
    // console.log("加入購物車",this.element)
    // console.log(this.countTarget.textContent)
    this.hiddenTarget.value = this.countTarget.textContent
    console.log(this.hiddenTarget.value)
  }
  cartnum(){
    console.log("購物車數量",this.element)
  }
}
