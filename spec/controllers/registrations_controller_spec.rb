require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  describe 'POST #create' do
    let(:valid_params) do
      {
        user: {
          name: 'hh',
          email: 'verun.mak71@gmail.com',
          password: 'password123',
          password_confirmation: 'password123',
          role: 'doctor',
          doctor: {
            specialty: 'hh',
            city: 'mieres',
            clinic_name: 'jjj',
            description: 'llll'
          }
        },
        commit: 'Sign up'
      }
    end

    context 'with valid parameters' do
      it 'creates a new doctor and redirects to doctors appointments path for patients' do
        post :create, params: valid_params
        expect(response).to redirect_to(doctors_appointments_path)
        expect(flash[:notice]).to eq('User was successfully created.')
      end

      it 'creates a new user and redirects to appointments path for doctors' do
        valid_params[:user][:role] = 'doctor'
        post :create, params: valid_params
        expect(response).to redirect_to(doctors_appointments_path)
        expect(flash[:notice]).to eq('User was successfully created.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { valid_params.merge(user: { email: '' }) }

      it 'renders the new template with errors' do
        post :create, params: invalid_params
        expect(response).to render_template('users/registrations/new')
      end
    end
  end
end