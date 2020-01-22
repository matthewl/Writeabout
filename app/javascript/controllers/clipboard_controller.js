import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "source" ]

  connect() {
    if (document.queryCommandSupported("copy")) {
      this.buttonTarget.classList.add("clipboard--supported")
    }
  }

  copy() {
    var prompt = this.sourceTarget.getAttribute('data-text')
    const el = document.createElement('textarea')
    el.value = prompt
    el.setAttribute('readonly', '')
    el.style.position = 'absolute'
    el.style.left = '-9999px'
    document.body.appendChild(el)
    el.select()
    document.execCommand('copy')
    document.body.removeChild(el)

    var done = document.getElementById('copied')
    done.style.display = 'block'
    setTimeout(function () { done.style.display = 'none' }, 5000);
  }
}
