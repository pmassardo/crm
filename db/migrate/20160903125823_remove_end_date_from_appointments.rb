class RemoveEndDateFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :end_time, :datetime
  end
end
