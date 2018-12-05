class AddDescriptionShortToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :description_short, :text
  end
end
