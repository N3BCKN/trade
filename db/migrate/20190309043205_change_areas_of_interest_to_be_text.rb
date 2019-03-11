class ChangeAreasOfInterestToBeText < ActiveRecord::Migration[5.2]
  def change
  	change_column :contacts, :areas_of_interest, :text
  end
end
