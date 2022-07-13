import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="item"
export default class extends Controller {
  static targets = ["form", "checkbox", "addItemButton", "addItemForm", "input", "error", "submitButton", "addButton"]

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
    this.inputTarget.focus()
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

  removeErrors() {
    this.errorTarget.innerHTML = ''
    this.inputTarget.classList.remove('border-red-500', 'bg-red-100')
  }

  enableSubmit() {
    if (this.inputTarget.value.length > 0) {
      this.submitButtonTarget.disabled = false
      return
    }

    this.submitButtonTarget.disabled = true
  }

  hideFab() {
    document.getElementById('fab').classList.add('hidden', 'sm:flex')
  }

  showFab() {
    document.getElementById('fab').classList.remove('hidden', 'sm:flex')
  }
}
