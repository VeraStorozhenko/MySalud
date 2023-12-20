import AppCtrl from "./app";

export default class RegistrationsController extends AppCtrl {
    static values = { selectedRole: String };

    constructor() {
        super();
        this.isDoctor = false
    }

    toggleForm() {
        console.log('toggle form')
        this.isDoctor = !this.isDoctor;
        this.showForm()
        console.log('after show form')
    }

    showForm() {
        toggleClass('#patient-form', 'hidden')
        toggleClass('#doctor-form', 'hidden')
    }
}