class CreateAttendants < ActiveRecord::Migration
  def change
    create_table :attendants do |t|
      t.references :appointment, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
