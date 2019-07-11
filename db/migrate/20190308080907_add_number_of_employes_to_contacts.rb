class AddNumberOfEmployesToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :number_of_employes, :integer
    add_column :contacts, :annual_sales, :integer
    add_column :contacts, :areas_of_interest, :string
  end
end
