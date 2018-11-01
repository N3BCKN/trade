class AddDeletedAtToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :deleted_at, :datetime
    add_index :leads, :deleted_at
  end
end
