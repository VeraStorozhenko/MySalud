class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :city, presence: true
  validates :clinic_name, presence: true
  validates :specialty, presence: true
end
