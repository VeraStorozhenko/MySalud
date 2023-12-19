class HomeController < ApplicationController
  def index
    p '!!!!!!!!!!!!!!!!!!!!!!!'
    p current_user

    if current_user&.role == 'patient'
      redirect_to patients_appointments_path
    elsif current_user&.role == 'doctor'
      redirect_to appointments_doctors_path
    end
  end
end
