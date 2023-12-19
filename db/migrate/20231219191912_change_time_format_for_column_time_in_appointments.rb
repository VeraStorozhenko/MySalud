class ChangeTimeFormatForColumnTimeInAppointments < ActiveRecord::Migration[7.0]
  def up
    remove_column :appointments, :time
    add_column :appointments, :time, :datetime
  end

  def down
    remove_column :appointments, :time
    add_column :appointments, :time, :time
  end
end
