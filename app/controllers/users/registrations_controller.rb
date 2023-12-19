class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    build_resource(sign_up_params)

    role = params[:user][:role]
    if role == 'patient'
      resource.build_patient(patient_params)
    elsif role == 'doctor'
      resource.build_doctor(doctor_params)
    end

    if resource.save
      sign_in(resource)
      if role == 'patient'
        redirect_to patients_appointments_path, notice: "User was successfully created."
      elsif role == 'doctor'
        redirect_to doctors_appointments_path, notice: "User was successfully created."
      end
    else
      render :template => 'users/registrations/new', locals: { resource: resource}
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :role])
  end

  def doctor_params
    params.require(:user).require(:doctor).permit(
      :city,
      :specialty,
      :clinic_name,
      :description,
    )
  end

  def patient_params
    params.require(:user).require(:patient).permit(
      :date_of_birth,
      )
  end

  protected

  def after_sign_up_path_for(resource)
    if resource.patient?
      patients_appointments_path
    elsif resource.doctor?
      appointments_doctors_path
    end
  end
end
