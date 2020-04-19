class RemoveOrganiztionIdFromOrganization < ActiveRecord::Migration[6.0]
  def change

    remove_column :organizations, :organiztion_id, :integer
  end
end
