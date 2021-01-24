import { Controller } from "stimulus"
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ["count", "hidden", "link"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
  addcart(){
    this.hiddenTarget.value = this.countTarget.textContent
    console.log(this.hiddenTarget.value)
    let href = this.linkTarget.getAttribute('href').replace(/\/\?quantity=\d*/, '')
    this.linkTarget.setAttribute('href', `${href}/?quantity=${this.hiddenTarget.value}`)
  }
  cartnum(){
    console.log("購物車數量",this.element)
  }
}
