import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    if (document.queryCommandSupported("copy")) {
      this.buttonTarget.classList.add("theme--supported")
    }
  }

  switch() {
    const body = document.body

    if (body.classList.contains('light')) {
      body.classList.remove('light')
      body.classList.add('dark')
    }
    else
    {
      body.classList.remove('dark')
      body.classList.add('light')
    }
  }
}
