class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.references :event, null: false, foreign_key: true
      t.references :sender, null: false
      t.references :target, null: false
      t.string :title
      t.boolean :status
      t.timestamps
    end

    add_index :users, :senders
    add_index :users, :targets
    add_index :users, [:sender, :target]

  end
end
