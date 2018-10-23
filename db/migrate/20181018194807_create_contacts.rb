class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :address
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :phone_number
      t.string :email
      t.string :home_page
      t.text :company_description
      t.integer :year_of_establishment

      t.timestamps
    end
  end
end
