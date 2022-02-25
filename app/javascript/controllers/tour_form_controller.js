import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    document.getElementById('add-picture-field').addEventListener('click', this.addNewField);

    document.querySelectorAll('.tour-picture-delete').forEach((button) => {
      button.addEventListener('click', this.deletePicture);
    });
  }

  addNewField(e) {
    e.preventDefault();
    const toursFormContainer = document.getElementById('picture-fields-container');
    const newField = document.createElement('input');
    newField.classList.add('form-control');
    newField.name = 'tour[files][]';
    newField.type = 'file';
    toursFormContainer.appendChild(newField);
  }

  deletePicture(e) {
    e.preventDefault();
    const imageId = e.target.dataset.pictureId;
    if(confirm('Are you sure you want to delete this image?')) {
      const csrfToken = document.querySelector("[name='csrf-token']").content
      fetch(`/pictures/${imageId}`,
         {
           method: 'DELETE',
           headers: {'X-CSRF-Token': csrfToken, "Content-Type": "application/json"}
        })
        .then(response => response.json)
        .then((response) => {
          document.getElementById(`picture-item-${imageId}`).remove();
        });
    }
  }
}
