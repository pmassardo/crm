class AddDefaultToContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :active, :boolean, :default => true
  end
end
