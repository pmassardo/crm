class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :account_type, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :phone
      t.text :notes

      t.timestamps null: false
    end
  end
end
