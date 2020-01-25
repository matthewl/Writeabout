import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    if (document.queryCommandSupported("copy")) {
      this.buttonTarget.classList.add("theme--supported")
      this.readCookieTheme()
    }
  }

  switch() {
    let body = document.body

    if (body.classList.contains('light')) {
      this.switchToDark()
      this.writeCookieTheme('dark')
    }
    else
    {
      this.switchToLight()
      this.writeCookieTheme('light')
    }
  }

  switchTheme(theme) {
    if (theme == 'dark') {
      this.switchToDark()
      this.writeCookieTheme('dark')
    }
    else
    {
      this.switchToLight()
      this.writeCookieTheme('light')
    }
  }

  switchToLight() {
    let body = document.body
    body.classList.remove('dark')
    body.classList.add('light')
  }

  switchToDark() {
    let body = document.body
    body.classList.remove('light')
    body.classList.add('dark')
  }

  writeCookieTheme(theme) {
    let now = new Date()
    now.setMonth( now.getYear() + 10 )
    document.cookie = "theme=" + theme
    document.cookie = "expires=" + now.toUTCString() + ";"
  }

  readCookieTheme() {
    const allcookies = document.cookie
    const cookiearray = allcookies.split(';')
    
    for(var i=0; i<cookiearray.length; i++) {
      const name = cookiearray[i].split('=')[0].trim()
      const value = cookiearray[i].split('=')[1].trim()
      if (name == 'theme') {
        this.switchTheme(value)
      }
    }
  }
}
