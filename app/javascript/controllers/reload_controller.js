// app/javascript/controllers/reload_controller.js
import { Controller } from 'stimulus';

export default class extends Controller {
    connect() {
        this.element.addEventListener('click', this.handleClick.bind(this));
    }

    handleClick(event) {
        const { target } = event;

        if (target.dataset.action === 'replace') {
            event.preventDefault();
            window.location.href = target.href;
        }
    }
}