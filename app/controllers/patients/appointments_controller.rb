class Patients::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_appointment, only: [:show]
  before_action :set_doctor, only: [:new, :create]
  before_action :get_doctors, only: [:new]

  def new
    @appointment = Appointment.new
  end

  def index
    @q = current_user.patient.appointments.joins(:patient, :doctor).order(:time)
    @pagy, @appointments = pagy(@q, items: 4)
  end

  def create
    @appointment = current_user.patient.appointments.build(appointment_params)
    @appointment.doctor = @doctor

    if @appointment.save
      redirect_to patients_appointments_path, turbolinks: true
    else
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
    if @doctor.blank?
      @doctor = Doctor.new
    end
  end

  def appointment_params
    params.require(:appointment).permit(:time, :description, :surgery_type, :left_photo, :front_photo, :right_photo)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def get_doctors
    @doctors = Doctor.joins(:user).all.collect {|doctor| [ doctor.user.name, doctor.id ] }
  end
end