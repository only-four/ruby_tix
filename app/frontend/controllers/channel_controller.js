import { Controller } from "stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  static targets = [ "messages", "newMessage" ]

  connect() {
    this.subscription = consumer.subscriptions.create({ channel: "MessageChannel", id: this.data.get("id") }, {
      connected: this._connected.bind(this),
      disconnected: this._disconnected.bind(this),
      received: this._reveiced.bind(this)
    })
  }

  _connected(){

  }

  _disconnected(){
    consumer.subscription.remove(this.subscription)
  }

  _reveiced(data){
    if (data.message) {
      this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
    }
  }

  clearMessage(event){
    this.newMessageTarget.value = ''
  }
}