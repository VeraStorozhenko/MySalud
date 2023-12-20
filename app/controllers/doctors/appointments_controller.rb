class Doctors::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: [:new, :create]
  before_action :set_appointment, only: [:show]

  def index
    @q = current_user.doctor.appointments.joins(:patient).order(:time)
    @pagy, @appointments = pagy(@q, items: 6)
  end
end