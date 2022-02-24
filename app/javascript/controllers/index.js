// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("controllers", true, /_controller\.js$/);
application.load(definitionsFromContext(context));

const addPictureButton = document.getElementById("add-picture-field");
if (addPictureButton) {
	addPictureButton.addEventListener("click", (e) => {
		e.preventDefault();
		const toursFormContainer = document.getElementById("picture-fields-container");
		const newField = document.createElement("input");
		newField.classList.add("form-control");
		newField.name = "tour[files][]";
		newField.type = "file";
		toursFormContainer.appendChild(newField);
	});
}

const tourPictureDeleteButtons = document.querySelectorAll(".tour-picture-delete");
tourPictureDeleteButtons.forEach((button) => {
	button.addEventListener("click", (e) => {
		e.preventDefault();
		alert("Cannot delete pictures yet");
	});
});
