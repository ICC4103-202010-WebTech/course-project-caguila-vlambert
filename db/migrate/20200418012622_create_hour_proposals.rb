class CreateHourProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :hour_proposals do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :vote
      t.boolean :is_voter_creator

      t.timestamps
    end
  end
end
