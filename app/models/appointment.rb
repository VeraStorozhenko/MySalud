class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  has_one_attached :left_photo
  has_one_attached :right_photo
  has_one_attached :front_photo

  enum surgery_type: { face: 0, breast: 1, other: 2 }

  validates :surgery_type, presence: true
  validates :left_photo, presence: true
  validates :right_photo, presence: true
  validates :front_photo, presence: true
  validates :doctor_id, presence: true
  validates :time, presence: true
  validate :date_must_be_in_future
  validate :validate_attachment_size

  private

  def date_must_be_in_future
    if time.present? && time < Date.today
      errors.add(:time, "must be in the future")
    end
  end

  def validate_attachment_size
    if left_photo.attached? && left_photo.blob.byte_size > 3.megabytes
      errors.add(:left_photo, 'size must be less than 3MB')
    end
    if right_photo.attached? && right_photo.blob.byte_size > 3.megabytes
      errors.add(:right_photo, 'size must be less than 3MB')
    end
    if front_photo.attached? && front_photo.blob.byte_size > 3.megabytes
      errors.add(:front_photo, 'size must be less than 3MB')
    end
  end
end
