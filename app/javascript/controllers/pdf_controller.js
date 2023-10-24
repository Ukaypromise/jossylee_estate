import { Controller } from "@hotwired/stimulus";
import { jsPDF } from "jspdf";

// Connects to data-controller="pdf"
export default class extends Controller {
  generatePDF() {
    const data = document.getElementById("download");
    this.doc.html(data.innerHTML).save("order_receipt.pdf");
  }

  connect() {
    this.doc = new jsPDF();
  }
}
