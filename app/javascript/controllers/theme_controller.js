import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["light", "dark", "system"]

  connect() {
    this.switchTheme()
  }

  switchTheme() {
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }

  switchToLight() {
    localStorage.theme = 'light'
    this.switchTheme()
  }

  switchToDark() {
    localStorage.theme = 'dark'
    this.switchTheme()
  }

  switchToSystem() {
    localStorage.removeItem('theme')
    this.switchTheme()
  }
}
