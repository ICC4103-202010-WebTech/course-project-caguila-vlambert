class RemovePswIdFromPassword < ActiveRecord::Migration[6.0]
  def change

    remove_column :passwords, :psw_id, :integer
  end
end
