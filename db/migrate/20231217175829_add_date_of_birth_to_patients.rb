class AddDateOfBirthToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :date_of_birth, :date
  end
end
