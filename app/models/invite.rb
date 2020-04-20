class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :sender, :class_name => "User", :foreign_key => 'sender_id', :dependent => :delete_all
  belongs_to :target, :class_name => "User", :foreign_key => 'target_id',:dependent => :delete_all
end
