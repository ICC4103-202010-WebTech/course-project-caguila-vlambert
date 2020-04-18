class AddOrganizationRefToEvent < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :organization, null: true, foreign_key: true
  end
end
