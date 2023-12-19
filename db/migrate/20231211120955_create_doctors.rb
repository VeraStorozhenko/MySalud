class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :city
      t.string :specialty
      t.string :clinic_name
      t.timestamps
    end
  end
end
