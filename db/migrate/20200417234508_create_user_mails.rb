class CreateUserMails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_mails do |t|
      t.integer :mail_id
      t.references :user, null: false, foreign_key: true
      t.boolean :active
      t.string :mail

      t.timestamps
    end
  end
end
