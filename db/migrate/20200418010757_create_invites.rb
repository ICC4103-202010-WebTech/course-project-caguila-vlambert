class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.references :event, null: false, foreign_key: true
      t.references :sender, foreign_key: true
      t.references :target, foreign_key: {to_table: 'user'} 
      t.string :title
      t.boolean :status
      t.timestamps
    end
  end
end
