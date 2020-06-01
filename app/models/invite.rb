class Invite < ApplicationRecord
  belongs_to :event 
  belongs_to :sender, :class_name => "User", :foreign_key => 'sender_id'
  belongs_to :target, :class_name => "User", :foreign_key => 'target_id'
end
