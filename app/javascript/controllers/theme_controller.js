import { Controller } from "stimulus"

export default class extends Controller {
  switch() {
    var body = document.body

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
