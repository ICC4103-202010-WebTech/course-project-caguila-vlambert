class CreatePasswords < ActiveRecord::Migration[6.0]
  def change
    create_table :passwords do |t|
      t.integer :psw_id
      t.references :user, null: false, foreign_key: true
      t.string :psw
      t.boolean :active

      t.timestamps
    end
  end
end
