require 'rails_helper'

RSpec.describe Patients::AppointmentsController, type: :controller do
  let(:doctor) { create(:doctor) }
  let(:patient) { create(:patient) }
  let(:valid_params) { { appointment: attributes_for(:appointment) } }
  
  describe 'POST #create' do
    before do
      sign_in(patient.user)
      valid_params
    end

    context 'with valid parameters' do
      it 'creates a new appointment' do
        post :create, params: valid_params
        expect(response).to redirect_to(patients_appointments_path)
        expect(Appointment.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template' do
        invalid_params = valid_params.merge(appointment: { time: nil })
        post :create, params: invalid_params
        expect(response).to render_template(:new)
        expect(Appointment.count).to eq(0)
      end
    end
  end
end