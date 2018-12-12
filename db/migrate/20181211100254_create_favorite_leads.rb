class CreateFavoriteLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_leads do |t|
      t.references :user, foreign_key: true
      t.references :lead, foreign_key: true

      t.timestamps
    end
  end
end
