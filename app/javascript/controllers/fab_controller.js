import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fab"
export default class extends Controller {
  static targets = ["addButton", "newItemsButtons"]
  
  toggle() {
    if (this.newItemsButtonsTarget.classList.contains('active')) {
      this.collapse()
    } else {
      this.expand()
    }
  }

  collapse() {
    document.querySelector("main").classList.remove('blur-md', 'pointer-events-none')
    this.addButtonTarget.classList.remove('rotate-45', 'bg-blue-400')
    this.addButtonTarget.classList.add('shadow-lg', 'bg-blue-700')
    this.newItemsButtonsTarget.classList.remove('ease-in', 'duration-300', 'max-h-96', 'opacity-100', 'active')
    this.newItemsButtonsTarget.classList.add('max-h-0', 'opacity-0')
  }

  expand() {
    document.querySelector("main").classList.add('blur-md', 'pointer-events-none')
    this.addButtonTarget.classList.add('rotate-45', 'bg-blue-400')
    this.addButtonTarget.classList.remove('shadow-lg', 'bg-blue-700')
    this.newItemsButtonsTarget.classList.add('ease-in', 'duration-300', 'max-h-96', 'opacity-100', 'active')
    this.newItemsButtonsTarget.classList.remove('max-h-0', 'opacity-0')
  }

  collapseIfOutsideClick(event) {
    // Ignore event if clicked within element
    if(this.element === event.target || this.element.contains(event.target)) return;
  
    // Collapse menu
    this.collapse()
  }
}
