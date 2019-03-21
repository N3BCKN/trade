class AddLocationToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :longitude, :float
    add_column :contacts, :latitude, :float
  end
end
