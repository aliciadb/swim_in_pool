import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static targets = ["start","end","price"]

  connect() {
    this.dailyPrice = Number.parseFloat(this.priceTarget.innerText, 10)
    console.log(this.startTarget.value)

  }
  calculatePrice() {
    console.log(new Date(this.startTarget.value))
    if (this.startTarget.value && this.endTarget.value) {
      const diffTime = new Date(this.endTarget.value) - new Date(this.startTarget.value)
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
      console.log(diffDays)
      this.priceTarget.innerText = (diffDays * this.dailyPrice).toFixed(1) + "€"

    }
  }
}
