class RemoveEventChatIdFromEventChat < ActiveRecord::Migration[6.0]
  def change

    remove_column :event_chats, :event_chat_id, :integer
  end
end
