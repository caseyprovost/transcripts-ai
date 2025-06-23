import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
  }

  save(event)  {
    this.element.requestSubmit();
  }

  saveOnEnter(event) {
    if (event.key === "Enter" || event.keyCode === 13) {
      event.preventDefault();
      this.element.requestSubmit();
      this.reset()
    }
  }
}
