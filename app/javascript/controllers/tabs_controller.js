import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["alltabs", "allcontent"];
	connect() {
		console.log("Hello from our first Stimulus controller");
	}

	active(e) {
		const current = e.currentTarget;
		Array.from(this.alltabsTarget.children).forEach((element) => {
			element.classList.remove("active");
		});
		current.classList.add("active");

		const attribute = current.getAttribute("data-target");
		const contentArray = Array.from(this.allcontentTarget.children);
		console.log(contentArray);
		contentArray.forEach((element) => {
			element.classList.toggle("hidden", true);
		});

		contentArray.forEach((element) => {
			console.log(element.getAttribute("data-target"));
			if (element.getAttribute("data-target") == attribute) {
				element.classList.remove("hidden");
				console.log(element.classList);
			}
		});
	}
}
