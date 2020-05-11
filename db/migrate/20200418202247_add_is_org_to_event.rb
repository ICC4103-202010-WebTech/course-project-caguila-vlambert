class AddIsOrgToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :is_org, :boolean
  end
end
