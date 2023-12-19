class HomeController < ApplicationController
  def index
    if current_user&.role == 'patient'
      redirect_to patients_appointments_path
    elsif current_user&.role == 'doctor'
      redirect_to doctors_appointments_path
    end
  end
end
