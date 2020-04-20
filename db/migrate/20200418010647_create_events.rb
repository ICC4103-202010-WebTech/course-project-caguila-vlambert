class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :description
      t.string :place
      t.references :user, null: true, foreign_key: true
      t.integer :event_id
      t.timestamps
    end
  end
end
