class AddCategoryIdToLeads < ActiveRecord::Migration[5.2]
  def change
    add_reference :leads, :category, foreign_key: true
  end
end
