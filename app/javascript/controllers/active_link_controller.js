import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"];

  connect() {
    // console.log("connected")
    this.highlightedActiveLink();
  }
  highlightedActiveLink() {
    this.linkTargets.forEach((link) => {
      if (link.href === window.location.href) {
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
  }
}
