import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["message"]

  messageTargetConnected() {
    setTimeout(() => this.dismiss(), 3000)
  }

  dismiss() {
    this.messageTarget.classList.add('overflow-hidden', 'h-0')
    this.messageTarget.classList.remove('px-4', 'py-2')
  }
}
