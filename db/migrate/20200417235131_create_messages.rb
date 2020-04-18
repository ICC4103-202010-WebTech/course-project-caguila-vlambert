class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :target
      t.references :sender
      t.string :content
      t.boolean :seen
      t.timestamps
    end
  end
end
