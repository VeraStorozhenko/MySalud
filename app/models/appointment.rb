class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  has_one_attached :left_photo
  has_one_attached :right_photo
  has_one_attached :front_photo

  enum surgery_type: { face: 0, breast: 1, other: 2 }

  validates :surgery_type, presence: true
  validates :doctor, presence: true
  validates :time, presence: true
  validate :date_must_be_in_future

  private

  def date_must_be_in_future
    # if time.present? && time < Date.today
    #   errors.add(:time, "must be in the future")
    # end
  end
end
