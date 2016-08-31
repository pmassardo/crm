class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :account, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.text :notes

      t.timestamps null: false
    end
  end
end
