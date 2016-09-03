class AddStartTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :start_time, :float
  end
end
