import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['textField'];

  oldValue = '';

  showForm() {
    this.oldValue = this.textFieldTarget.value;
    this.element.classList.add('editing');
    this.textFieldTarget.focus();
  }

  handleKeyDown(e) {
    if (e.key === 'Escape') {
      this.element.classList.remove('editing');
      this.textFieldTarget.value = this.oldValue;
    }
  }
}
