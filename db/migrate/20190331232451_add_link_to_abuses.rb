class AddLinkToAbuses < ActiveRecord::Migration[5.2]
  def change
    add_column :abuses, :link, :text
  end
end
