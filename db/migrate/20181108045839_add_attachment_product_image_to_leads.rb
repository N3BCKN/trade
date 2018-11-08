class AddAttachmentProductImageToLeads < ActiveRecord::Migration[5.2]
  def self.up
    change_table :leads do |t|
      t.attachment :product_image
    end
  end

  def self.down
    remove_attachment :leads, :product_image
  end
end
