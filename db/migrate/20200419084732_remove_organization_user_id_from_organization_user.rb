class RemoveOrganizationUserIdFromOrganizationUser < ActiveRecord::Migration[6.0]
  def change

    remove_column :organization_users, :organization_user_id, :integer
  end
end
