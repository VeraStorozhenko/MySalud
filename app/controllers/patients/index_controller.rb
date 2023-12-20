class Patients::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient

  def doctors_list
    @q = Doctor.joins(:user).ransack(params[:q])
    @pagy, @doctors = pagy(@q.result(distinct: true), items: 6)

    render 'patients/doctors_list'
  end

  private

  def patient_params
    params.require(:patient).permit(user_attributes: [:name, :email,:avatar, :password, :password_confirmation])
  end

  def set_patient
    @patient = current_user.patient
  end
end