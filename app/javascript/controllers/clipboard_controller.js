import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "notification", "source" ]

  connect() {
    if (document.queryCommandSupported("copy")) {
      this.buttonTarget.classList.add("clipboard--supported")
    }
  }

  copy() {
    const prompt = this.sourceTarget.getAttribute('data-text')
    this.copyPrompt(prompt)

    this.notificationTarget.style.display = 'block'
    setTimeout(function () { this.notificationTarget.style.display = 'none' }, 5000);
  }

  copyPrompt(prompt) {
    const el = document.createElement('textarea')
    el.value = prompt
    el.setAttribute('readonly', '')
    el.style.position = 'absolute'
    el.style.left = '-9999px'
    document.body.appendChild(el)
    el.select()
    document.execCommand('copy')
    document.body.removeChild(el)
  }
}
