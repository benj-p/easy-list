import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="note"
export default class extends Controller {
  static targets = ["textArea", "editForm", "spinner"]

  connect() {
    this.resizeTextArea()
    this.inputTimeout = null
  }

  resizeTextArea() {
    // Resets height to zero to correctly decrease size
    this.textAreaTarget.style.height = 0
    this.textAreaTarget.style.height = this.textAreaTarget.scrollHeight + 'px'
  }

  saveInput() {
    clearTimeout(this.inputTimeout)
    this.inputTimeout = setTimeout(() => {
      this.spinnerTarget.classList.remove('invisible')
      this.editFormTarget.requestSubmit()
    }, 200)
  }
}