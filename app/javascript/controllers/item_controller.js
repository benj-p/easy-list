import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="item"
export default class extends Controller {
  static targets = ["form", "checkbox", "addItemButton", "addItemForm"]

  submitForm() {
    this.formTarget.requestSubmit()
  }

  toggleCheckbox() {
    this.checkboxTarget.checked = !this.checkboxTarget.checked
    this.submitForm()
  }

  showAddItemForm() {
    this.addItemButtonTarget.classList.add('hidden')
    this.addItemFormTarget.classList.remove('hidden')
  }

  hideAddItemForm() {
    this.addItemButtonTarget.classList.remove('hidden')
    this.addItemFormTarget.classList.add('hidden')
  }

  hideFormIfOutsideClick(event) {
    // Ignore event if clicked within element
    if(this.element === event.target || this.element.contains(event.target)) return;
  
    // Hide form and show Add Item button
    this.hideAddItemForm()
  }
}
