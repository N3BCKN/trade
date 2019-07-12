class AddSenderIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :sender
    add_reference :messages, :receiver
  end
end
