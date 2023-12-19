class Patients::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: [:new, :create]
  before_action :set_appointment, only: [:show]

  def new
    @appointment = Appointment.new
    @doctors = Doctor.joins(:user).all.collect {|doctor| [ doctor.user.name, doctor.id ] }
  end

  def index
    @q = current_user.patient.appointments.joins(:patient, :doctor)
    @pagy, @appointments = pagy(@q, items: 4)
  end

  def create
    @appointment = current_user.patient.appointments.build(appointment_params)
    @appointment.doctor = @doctor

    p '@appointment@appointment'
    p @appointment
    if @appointment.save
      redirect_to patients_appointments_path
    else
      p '=========='
      p @appointment.errors.full_messages
      @doctors = Doctor.joins(:user).all.collect {|doctor| [ doctor.user.name, doctor.id ] }
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize! :read, @appointment
  end

  private

  def set_doctor
    @doctor = Doctor.find_by_id(params[:doctor_id])
    p '@doctor@doctor@doctor@doctor'
    p @doctor
    if @doctor.blank?
      @doctor = Doctor.new
    end
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :description, :surgery_type, :left_photo, :front_photo, :right_photo)
  end
end