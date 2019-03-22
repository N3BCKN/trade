class RemoveHomePageFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :home_page, :string
  end
end
