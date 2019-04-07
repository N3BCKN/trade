class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.references :guest

      t.timestamps
    end
  end
end
