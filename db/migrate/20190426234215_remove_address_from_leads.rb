class RemoveAddressFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :address, :text
    remove_column :leads, :city, :string
    remove_column :leads, :email, :string
    remove_column :leads, :zip_code, :string
  end
end
