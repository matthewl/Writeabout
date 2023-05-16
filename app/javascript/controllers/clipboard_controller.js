import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "notification", "source" ]

  connect() {}

  copy() {
    event.preventDefault()
    const text = this.sourceTarget.getAttribute("data-text")
    navigator.clipboard.writeText(text)

    this.buttonTarget.textContent = "Copied!"
    setTimeout(() => {
      this.buttonTarget.textContent = "Copy to clipboard"
    }, 1000)
  }
}