class CreateEventChats < ActiveRecord::Migration[6.0]
  def change
    create_table :event_chats do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.integer :event_chat_id

      t.timestamps
    end
  end
end
