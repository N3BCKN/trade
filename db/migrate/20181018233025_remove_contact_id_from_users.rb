class RemoveContactIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :contact, foreign_key: true
  end
end
