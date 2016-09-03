class RemoveStartTimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :start_time, :datetime
  end
end
