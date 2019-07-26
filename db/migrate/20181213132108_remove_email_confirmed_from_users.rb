class RemoveEmailConfirmedFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email_confirmed, :boolean
    remove_column :users, :confirm_token, :string
  end
end
