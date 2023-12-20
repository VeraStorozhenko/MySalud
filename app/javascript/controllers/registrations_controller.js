import AppCtrl from "./app";

export default class RegistrationsController extends AppCtrl {
    static values = { selectedRole: String };

    constructor() {
        super();
        this.isDoctor = false
    }

    toggleForm() {
        this.isDoctor = !this.isDoctor;
        this.showForm()
    }

    showForm() {
        toggleClass('#patient-form', 'hidden')
        toggleClass('#doctor-form', 'hidden')
    }
}