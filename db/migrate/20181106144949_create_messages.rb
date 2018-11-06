class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :email
      t.string :contact_person
      t.string :country
      t.string :phone_number
      t.references :lead, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
