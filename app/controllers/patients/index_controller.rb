class Patients::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient

  def dashboard
    @patient = current_user.patient
    # Add additional data as needed
  end

  def index
    p '00000000000000'
    p @appointments = @patient.appointments

  end

  def doctors_list
    p 'doccccctorrr list'
    @q = Doctor.joins(:user).ransack(params[:q])#.page(params[:page])
    @pagy, @doctors = pagy(@q.result(distinct: true), items: 4)

    render 'patients/doctors_list'
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      # Handle successful patient sign-up
    else
      #messages are not displaying in html
      render :new
    end
  end

  private

  def patient_params
    params.require(:patient).permit(user_attributes: [:name, :email,:avatar, :password, :password_confirmation])
  end

  def set_patient
    @patient = current_user.patient
  end
end