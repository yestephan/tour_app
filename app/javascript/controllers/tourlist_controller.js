import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "list", "more" ]

  connect () {
    console.log("Hello")
  }

  toggleTab(event) {
    const clickedElement = event.currentTarget
    console.log(clickedElement.dataset.target)

    if (clickedElement.dataset.target === "more") {
      this.moreTarget.style.display = "block"
      this.listTarget.style.display = "none"
    }

    if (clickedElement.dataset.target === "list") {
      this.listTarget.style.display = "block"
      this.moreTarget.style.display = "none"
    }
    // // Get all elements with class="tabcontent" and hide them
    // tabcontent = document.getElementsByClassName("tabcontent");
    // for (i = 0; i < tabcontent.length; i++) {
    //   tabcontent[i].style.display = "none";
    // }

    // // Get all elements with class="tablinks" and remove the class "active"
    // tablinks = document.getElementsByClassName("tablinks");
    // for (i = 0; i < tablinks.length; i++) {
    //   tablinks[i].className = tablinks[i].className.replace(" active", "");
    // }

    // // Show the current tab, and add an "active" class to the button that opened the tab
    // document.getElementById(cityName).style.display = "block";
    // evt.currentTarget.className += " active";
  }
}
