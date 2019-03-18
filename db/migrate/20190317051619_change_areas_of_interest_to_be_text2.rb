class ChangeAreasOfInterestToBeText2 < ActiveRecord::Migration[5.2]
  def change
  	disable_extension "citext"
  	remove_column :contacts, :areas_of_interest, :jsonb
  	add_column :contacts, :areas_of_interest, :text
  end
end
