class AddActiveToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :active, :boolean
  end
end
