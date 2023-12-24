class Patients::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:edit, :update, :destroy]
  before_action :set_doctor, only: [:new, :create, :update, :edit]
  before_action :get_doctors, only: [:new, :edit]

  def index
    @q = current_user.patient.appointments.joins(:patient, :doctor).order(:time)
    @pagy, @appointments = pagy(@q, items: 6)
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patients_appointments_path, notice: "Appointment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end

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

  def destroy
    @appointment.destroy

    redirect_to root_path, notice: "Appointment was successfully deleted."
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

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def get_doctors
    @doctors = Doctor.joins(:user).all.collect {|doctor| [ doctor.user.name, doctor.id ] }
  end
end