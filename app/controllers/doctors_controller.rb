class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor

  def appointments
    p '00000000000000'
    p '################'
    p current_user
    p current_user.doctor
    p @appointments = @doctor.index

  end
  def index
    @doctor = current_user.doctor
    @q =  @doctor.index.includes(:patient).ransack(params[:q])
    @appointments = @q.result(distinct: true)
    @pagy, @appointments= pagy(@q.result.order(created_at: :desc), items: 5)
  end

  private

  def set_doctor
    @doctor = current_user.doctor
  end
end