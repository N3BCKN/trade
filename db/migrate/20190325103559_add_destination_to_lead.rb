class AddDestinationToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :destination, :string
    add_column :leads, :quantity, :string
    add_column :leads, :freqency, :string
    add_column :leads, :prefered_suppliers , :string
  end
end
