class AddCountToHourProposal < ActiveRecord::Migration[6.0]
  def change
    add_column :hour_proposals, :count, :integer
  end
end
