class CreateEventFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :event_files do |t|
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
