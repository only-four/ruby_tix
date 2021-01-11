import { Controller } from "stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  static targets = []

  connect() {
    this.subscription = consumer.subscription.create({ channel: "MessageChannel", id: this.data.get("id")}, {
      connected: this._connected.bind(this),
      disconnected: this._disconnected.bind(this),
      received: this._reveiced.bind(this),
    })
  }
  _connected(){
  }

  _disconnected(){
  }

  _reveiced(){    
  }
}