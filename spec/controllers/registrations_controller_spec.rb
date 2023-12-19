require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  describe 'POST #create' do
    let(:valid_params) do
      {
        user: {
          name: 'John Doe',
          email: 'john@example.com',
          password: 'Savjjj4343',
          password_confirmation: 'Savjjj4343',
          role: 'patient',
          patient: { date_of_birth: '1990-01-01' }
        }
      }
    end

    context 'with valid parameters' do
      it 'creates a new user and redirects to appointments path for patients' do
        post :create, params: valid_params
        expect(response).to redirect_to(patients_appointments_path)
        expect(flash[:notice]).to eq('User was successfully created.')
      end

      it 'creates a new user and redirects to appointments path for doctors' do
        valid_params[:user][:role] = 'doctor'
        post :create, params: valid_params
        expect(response).to redirect_to(appointments_doctors_path)
        expect(flash[:notice]).to eq('User was successfully created.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { valid_params.merge(user: { email: '' }) }

      it 'renders the new template with errors' do
        post :create, params: invalid_params
        expect(response).to render_template('users/registrations/new')
        expect(assigns(:resource).errors).not_to be_empty
      end
    end
  end
end