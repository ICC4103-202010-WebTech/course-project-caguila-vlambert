class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.integer :organiztion_id
      t.string :description
      t.string :place
      t.string :name

      t.timestamps
    end
  end
end
