class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.boolean :guest
      t.boolean :admin
      t.datetime :last

      t.timestamps
    end
  end
end
