class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :title
      t.string :lead_status
      t.text :description
      t.string :contact_person
      t.text :address
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :phone_number
      t.string :email
      t.string :home_page

      t.timestamps
    end
  end
end
