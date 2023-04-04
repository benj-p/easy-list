import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ['item']
  static values = { class: String }
  csrfToken = document.querySelector("[name='csrf-token']").content

  connect() {
    Sortable.create(this.element, {
      onEnd: () => {
        const ranks = this.itemTargets.reduce((a, v, i) => ({...a, [v.id.replace(/\D+/g, "")]: i}))
        
        fetch('/update_ranks', {
          method: "POST",
          headers: {
            "X-CSRF-Token": this.csrfToken,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ ranks: ranks, class: this.classValue })
        })
      }
    })
  }
}
