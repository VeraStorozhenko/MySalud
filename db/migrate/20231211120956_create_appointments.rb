class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.time :time
      t.integer :surgery_type
      t.text :description
      t.binary :left_photo
      t.binary :right_photo
      t.binary :front_photo

      t.timestamps
    end
  end
end
