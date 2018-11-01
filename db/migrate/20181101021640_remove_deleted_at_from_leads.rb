class RemoveDeletedAtFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_index :leads, :deleted_at
    remove_column :leads, :deleted_at, :datetime
  end
end
