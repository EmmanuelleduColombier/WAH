import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["prev", "next"]

  movePrev() {
    const active = document.querySelector(".active")
    if (active.previousElementSibling) {
      active.previousElementSibling.classList.add("active")
      active.classList.remove("active")
    }
  }

  moveNext() {
    const active = document.querySelector(".active")
    if (active.nextElementSibling) {
      active.nextElementSibling.classList.add("active")
      active.classList.remove("active")
    } else {
      document.querySelector(".carousel-item").classList.add("active")
      active.classList.remove("active")
    }
  }
}
