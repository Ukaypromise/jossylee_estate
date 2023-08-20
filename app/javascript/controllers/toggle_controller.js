import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["toggleable"];

  connect() {
    // Add a click event listener to the document
    document.addEventListener("click", this.hideMenu.bind(this));
  }

  disconnect() {
    // Remove the click event listener when the controller is disconnected
    document.removeEventListener("click", this.hideMenu.bind(this));
  }

  toggle() {
    this.toggleableTarget.classList.toggle("hidden");
  }

  hideMenu(event) {
    // Check if the clicked element is not part of the menu
    if (!this.element.contains(event.target)) {
      this.toggleableTarget.classList.add("hidden");
    }
  }
}
