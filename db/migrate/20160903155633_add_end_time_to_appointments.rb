class AddEndTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :end_time, :float
  end
end
