# Create doctors with additional details
5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name,
    role: 'doctor'
  )

  user.create_doctor(
    city: Faker::Address.city,
    clinic_name: Faker::Company.name,
    specialty: Faker::Job.title
  )
end

# Create patients
5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name,
    role: 'patient'
  )
  user.create_patient!()
end

# Create index with photos
10.times do
  doctor = Doctor.all.sample
  patient = Patient.all.sample #User.where(role: 'patient').sample.patient

#   appointment = Appointment.create!(
#     doctor: doctor,
#     patient: patient,
#     procedure_type: :
#     datetime: Faker::Time.forward(days: 30, period: :morning)
#   )
#
#   # Attach three photos to each appointment
#   # Attach three random photos to each appointment
#   3.times do |index|
#     #image_url = Faker::LoremPixel.image("100x100", false, "people,#{index + 1}")
#     #appointment.photos.attach(io: URI.open(image_url), filename: "#{index + 1}_photo.jpg")
#   end
 end