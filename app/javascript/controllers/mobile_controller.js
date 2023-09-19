import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="mobile"
export default class extends Controller {
  static targets = ["mobilenav"];

  connect() {
    // Add a click event listener to the document
    document.addEventListener("click", this.hideMenu.bind(this));
  }

  disconnect() {
    // Remove the click event listener when the controller is disconnected
    document.removeEventListener("click", this.hideMenu.bind(this));
  }

  mobile() {
    this.mobilenavTarget.classList.toggle("hidden");
  }

  hideMenu(event) {
    // Check if the clicked element is not part of the menu
    if (!this.element.contains(event.target)) {
      this.mobilenavTarget.classList.add("hidden");
    }
  }
}
