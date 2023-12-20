FactoryBot.define do
  factory :appointment do
    time { Time.now + 1.day }
    description { Faker::Lorem.sentence }
    surgery_type { :face }

    left_photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures/files', 'left_photo.bmp'), 'image/bmp') }
    front_photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures/files', 'front_photo.bmp'), 'image/bmp') }
    right_photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures/files', 'right_photo.bmp'), 'image/bmp') }
    
    association :patient, factory: :patient
    association :doctor, factory: :doctor
  end
end