class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.doctor?
      can :read, Appointment, doctor_id: user.doctor.id
    elsif user.patient?
      can [:read, :create], Appointment, patient_id: user.patient.id
      can [:update, :destroy], Appointment, patient_id: user.patient.id
    end
  end
end
