class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :appointment_type, index: true, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.text :notes

      t.timestamps null: false
    end
  end
end
