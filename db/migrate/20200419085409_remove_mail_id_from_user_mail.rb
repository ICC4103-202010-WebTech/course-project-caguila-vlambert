class RemoveMailIdFromUserMail < ActiveRecord::Migration[6.0]
  def change

    remove_column :user_mails, :mail_id, :integer
  end
end
