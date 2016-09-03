class AddDateToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_date, :date
  end
end
