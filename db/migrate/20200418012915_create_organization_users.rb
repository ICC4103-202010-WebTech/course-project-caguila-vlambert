class CreateOrganizationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_users do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :active
      t.integer :organization_user_id
      t.timestamps
    end
  end
end
